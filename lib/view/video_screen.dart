import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:video_player/video_player.dart';

class VideosScreen extends StatefulWidget {
  VideosScreen({Key key}) : super(key: key);

  @override
  _VideosScreenState createState() {
    return _VideosScreenState();
  }
}

class _VideosScreenState extends State<VideosScreen> {
  ChewieController _chewieController;
  List<String>videosList=List<String>();
  TextEditingController searchController=TextEditingController();
  @override
  void initState() {
    videosList.add( 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    videosList.add('http://techslides.com/demos/sample-videos/small.mp4');
    videosList.add("https://www.youtube.com/watch?v=n67F-_A5Rrw");
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppConfig.appBar('VIDEO GUIDE', context),
      body: SafeArea(
          child:Container(
            color: Colors.white12,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Neumorphic(
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                    style: NeumorphicStyle(depth: -8,
                        shadowDarkColor: Colors.black54,
                        lightSource: LightSource.topLeft,
                        color: Colors.white,
                        intensity: 0.86,
                        surfaceIntensity: 0.5),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: TextField(
                          controller:searchController ,
                          textAlign: TextAlign.start,
                          maxLength: 10,
                          buildCounter: (BuildContext context,
                              {int currentLength,
                                int maxLength,
                                bool isFocused}) =>
                          null,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search,color: Colors.grey,),
                            filled: true,
                              fillColor: Colors.white,
                              hintText:'Search here....',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(top:20.0,left: 10.0
                              ,right: 10.0),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: videosList.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(parent: ScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Neumorphic(
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                        style: NeumorphicStyle(
                            shadowDarkColor: Colors.black54,
                            lightSource: LightSource.topLeft),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height:250.0,
                              child: Chewie(
                                controller: getChewieController(index),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: 40.0,
                              child: Center(
                                child: Text('Cultivation',style: TextStyle(
                                  color: Colors.green
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ) ),
    );
  }

  getChewieController(int index) {
     _chewieController=ChewieController(
      autoInitialize: true,
      aspectRatio: 3/2,
      videoPlayerController: VideoPlayerController.network(videosList[index])
    );
     return _chewieController;
  }

}