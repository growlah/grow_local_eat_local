import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grow_lah/model/app_drawer_list.dart';
import 'package:grow_lah/model/app_drawer_model.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/view/ar_view.dart';
import 'package:grow_lah/view/home_screen.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() {
    return _AppDrawerState();
  }
}

class _AppDrawerState extends State<AppDrawer> {
  List<AppDrawerModel> drawerList=List<AppDrawerModel>();
  static const platform = const MethodChannel('sample');
  @override
  void initState() {
     drawerList=AppDrawerList.drawerList();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color:Colors.green,
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top:40.0)
          ,child: Text(AppConfig.growLah,style: TextStyle(fontSize: 25.0,color: Colors.white,
            fontWeight: FontWeight.bold),),),
          ListView.builder(
              itemCount: drawerList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(parent: ScrollPhysics()),
              itemBuilder: (context,index){
               return Neumorphic(
                 style: NeumorphicStyle(color: Colors.transparent),
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: InkWell(
                     onTap: (){
                       var route=MaterialPageRoute(builder: (context)=>ARScreen());
                       Navigator.pop(context);
                       if(index==3){
                         Navigator.push(context, route);
                       }
                       if(index==1){
                        initNative();
                       }
                     },
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Row(
                           children: <Widget>[
                             Neumorphic(
                               style: NeumorphicStyle(color: Colors.transparent,depth: 8,
                              surfaceIntensity: 0.5),
                                 child: Image.asset(getImages(index),height: 50.0,),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Text(drawerList[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
               );
              }),
        ],
      ),
    );
  }

  // ignore: missing_return
  String getImages(int index) {
    switch(index){
      case 0:return Assets.settings;break;
      case 1:return Assets.profile;break;
      case 2:return Assets.language;break;
      case 3:return Assets.subscribe;break;
      case 4:return Assets.logout;break;
    }
  }

  Future initNative()async {
    var  result=null;
    try{
     result = await platform.invokeMethod("AR");}
    catch(e){
      print(e.toString());
    }
    return result;
  }
}