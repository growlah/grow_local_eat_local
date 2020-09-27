import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:grow_lah/view/scan_spot.dart';
import 'package:path_provider/path_provider.dart';

class TakePicture extends StatefulWidget {
  TakePicture({Key key}) : super(key: key);

  @override
  _TakePictureState createState() {
    return _TakePictureState();
  }
}

class _TakePictureState extends State<TakePicture> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;  @override
  @override
  void initState() {
    super.initState();
    // 1
    availableCameras().then((availableCameras) {

      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          // 2
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      }else{
        print("No camera available");
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(child: Stack(
        children: <Widget>[
          CameraPreview(controller),
          Padding(
            padding: const EdgeInsets.only(bottom:50.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  onTap: () {
                    _onCapturePressed(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child:Icon(Icons.camera,color:Colors.white,size: 40.0,),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  // 1, 2
  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    // 3
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    // 4
    controller.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    // 6
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }
  Widget _cameraTogglesRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        // child: FlatButton.icon(
        //     onPressed: _onSwitchCamera,
        //     icon: Icon(_getCameraLensIcon(lensDirection)),
        //     label: Text(
        //         "${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1)}")),
      ),
    );
  }
  void _onCapturePressed(context) async {
    try {
      // 1
      final path =
        (await getTemporaryDirectory()).path+'${DateTime.now()}.png';
      // 2
      await controller.takePicture(path);
      // 3
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanAndSpot(imagePath: path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

}