import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';

class ScanAndSpot extends StatefulWidget {
  ScanAndSpot({Key key, this.imagePath}) : super(key: key);
  String imagePath;
  @override
  _ScanAndSpotState createState() {
    return _ScanAndSpotState();
  }
}

class _ScanAndSpotState extends State<ScanAndSpot> {
  @override
  void initState() {
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
      appBar: AppConfig.appBar('SCAN & SPOT', context),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(parent: ScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Neumorphic(
                  style:AppConfig.neuStyle,
                  boxShape: AppConfig.neuShape,
                  child: Container(
                    height: 272.0,
                      width: 374.0,
                      child: Image.file(File(widget.imagePath),fit: BoxFit.cover,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 10.0,right: 10.0),
                child: Row(
                  children: <Widget>[
                    Neumorphic(
                      style:AppConfig.neuStyle,
                      boxShape: AppConfig.neuShape,
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Rose',style: TextStyle(fontSize: 18.0,
                            color: Colors.green),),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0,right: 10.0),
                      child: Neumorphic(
                        style:AppConfig.neuStyle,
                        boxShape: AppConfig.neuShape,
                        child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Rosaceae family'
                              ,style: TextStyle(fontSize: 18.0,
                                  color: Colors.green),),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,bottom: 20.0,left: 10.0,right: 10.0),
                child: getWeatherCards(),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text('About',
                  style: TextStyle(color: Colors.green,fontSize: 16.0,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10.0,top: 10.0),
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit. Facilisis lectus at a vulputate pellentesque'
                    'aliquet velit odio nullam. Mattis ut est ut enim.'
                    'Nullam lobortis dolor quis non mauris, dui sed'
                    'nunc quam. Gravida commodo vel at dignissim'
                    'integer.',
                  style: TextStyle(color: Colors.green,fontSize: 12.0),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getWeatherCards() {
       return Container(
         height: 150.0,
      child: Center(
        child: ListView.builder(
            itemCount: 3,
            physics:NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,position){
              return Padding(
                padding:  EdgeInsets.only(left:position==1?50.0:0,
                    right: position==1?50.0:0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Neumorphic(
                      style: NeumorphicStyle(color: Colors.white12),
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                      child: Container(
                        height: 80.0,
                        width: 90.0,
                        child:Icon(getImage(position),color: Colors.green,
                        size: 30.0,) ,
                      ),
                    ),
                    Text(getTitle(position),style:TextStyle(
                      color: Colors.green,fontSize: 12.0
                    ),),
                    Text(getPercentage(position),
                    style: TextStyle(color: Colors.green,fontSize: 18.0,fontWeight: FontWeight.bold),),
                  ],
                ),
              );
            }),
      ),
    );
  }

  IconData getImage(int position) {
    return position==0?Icons.cloud:position==1?
        Icons.wb_sunny:Icons.lightbulb_outline;
  }

  String getTitle(int position) {
    return position==0?'Humidity':position==1?
        'Light':'Temperature';
  }

  String getPercentage(int position) {
    return position==0?'64 %':position==1?
    'Diffused':'18-24 c';
  }

}