import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/model/profile_model.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/utils/common_strings.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() {
    return _MyProfileState();
  }
}

class _MyProfileState extends State<MyProfile> {
  bool hasImage = false;
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath = '';
  File imageFile;
  List<dynamic> myList = List();

  @override
  void initState() {
    myList = ProfileModel.profileList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppConfig.appBar(CommonStrings.myProfile1, context, true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(parent: ScrollPhysics()),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    changeImage();
                  },
                  child: Neumorphic(
                    style: AppConfig.neuStyle,
                    boxShape: NeumorphicBoxShape.circle(),
                    child: Container(
                      height: 120.0,
                      width: 120.0,
                      child: imageFile != null
                          ? Image.file(
                              imageFile,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(Assets.manIcon),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: AppConfig.roboto,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.edit,
                  color: Colors.green,
                  size: 18.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorphic(
                style: AppConfig.neuStyle,
                boxShape: AppConfig.neuShape,
                child: Container(
                  height: 40.0,
                  width: 90.0,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      '60 Points',
                      style: TextStyle(
                          fontFamily: AppConfig.roboto, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            getList()
          ],
        ),
      ),
    );
  }

  void changeImage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  seeImage();
                },
                title: Center(
                    child: Text(
                  CommonStrings.view,
                  style: TextStyle(
                      fontFamily: AppConfig.roboto,
                      fontWeight: FontWeight.bold),
                )),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  openCamera();
                },
                title: Center(
                    child: Text(CommonStrings.camera,
                        style: TextStyle(
                            fontFamily: AppConfig.roboto,
                            fontWeight: FontWeight.bold))),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  openGallery();
                },
                title: Center(
                    child: Text(CommonStrings.gallery,
                        style: TextStyle(
                            fontFamily: AppConfig.roboto,
                            fontWeight: FontWeight.bold))),
              ),
            ],
          );
        });
  }

  openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }

  openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  seeImage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 300.0,
              width: 200.0,
              child: imageFile != null
                  ? Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(Assets.manIcon),
            ),
          );
        });
  }

  Widget getList() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
          physics: ScrollPhysics(parent: ScrollPhysics()),
          scrollDirection: Axis.vertical,
          itemCount: myList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorphic(
                style: AppConfig.neuStyle,
                boxShape: AppConfig.neuShape,
                child: Container(
                  height: 55.0,
                  width: 374.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          myList[index],
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: AppConfig.roboto,
                          ),
                        ),
                        index == 0
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.green,
                              )
                            : index == 1
                                ? Image.asset(Assets.checkedIcon)
                                : Container()
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
