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
import 'package:grow_lah/view/refer_earn.dart';

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
      child: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top:50.0)
          ,child: Text(AppConfig.growLah,style: TextStyle(fontSize: 25.0,color: Colors.green,
            fontWeight: FontWeight.bold),),),
        Padding(padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
        child:   AppConfig.divider(),),
          ListView.builder(
              itemCount: drawerList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(parent: ScrollPhysics()),
              itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.only(left:20.0,top: 20.0),
                 child: InkWell(
                   onTap: (){
                     var route=MaterialPageRoute(builder: (context)=>ARScreen());
                     var route5=MaterialPageRoute(builder: (context)=>ReferAndEarn());
                     if(index==3){
                       Navigator.push(context, route);
                     }
                     if(index==5){
                       Navigator.pop(context);
                       Navigator.push(context, route5);
                     }
                   },
                   child: Column(
                     children: <Widget>[
                       Row(
                         children: <Widget>[
                           Image.asset(getImages(index),),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Text(drawerList[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                           ),
                         ],
                       )
                     ],
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
      case 0:return Assets.profileIcon;break;
      case 1:return Assets.donateIcon;break;
      case 2:return Assets.settingsIcon;break;
      case 3:return Assets.cart;break;
      case 4:return Assets.subscription;break;
      case 5:return Assets.stockGreen;break;
      case 6:return Assets.logOut;break;
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