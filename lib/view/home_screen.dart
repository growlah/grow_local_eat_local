import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/model/app_drawer_list.dart';
import 'package:grow_lah/model/app_drawer_model.dart';
import 'package:grow_lah/model/options.dart';
import 'package:grow_lah/model/options_list.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/view/app_drawer.dart';
import 'package:grow_lah/view/buy_sell.dart';
import 'package:grow_lah/view/chat_bot.dart';
import 'package:grow_lah/view/communication_section.dart';
import 'package:grow_lah/view/monitor_screen.dart';
import 'package:grow_lah/view/take_picture.dart';
import 'package:grow_lah/view/video_screen.dart';

import 'commuication_detail.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

List<Options> optionsList = List<dynamic>();
List<AppDrawerModel> drawerList=List<AppDrawerModel>();
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    optionsList = OptionsList.optionList();
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
    return Stack(
      children: <Widget>[
    AppConfig.bgWave(context),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              AppConfig.growLah,
              style: TextStyle(color: Colors.white, fontSize: 16, fontFamily:AppConfig.roboto,),
            ),
            elevation: 0.0,
          ),
          drawer: getDrawer(),
          body: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                  child: Text(
                    'Welcome !',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily:AppConfig.roboto,
                        color: Colors.green),
                  ),
                ),
                Expanded(child: mainView()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)
                        =>  ChatBot()));
                      },
                      child: bottomIcon()),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  setHeightWidth(int index) {
    switch (index) {
      case 0:
        return 180.0;
        break;
      case 1:
        return 150.0;
        break;
      case 2:
        return 180.0;
        break;
      case 3:
        return 150.0;
        break;
      case 4:
        return 170.0;
        break;
      case 5:
        return 200.0;
        break;
      default:
        return 150.0;
    }
  }

  Widget mainView() {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics:NeverScrollableScrollPhysics(),
        itemCount: optionsList.length,
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              itemSelected(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
              child: Center(
                child: Neumorphic(
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(25.0))),
                  style: NeumorphicStyle(
                      shadowDarkColor: Colors.grey,
                      lightSource: LightSource.topLeft),
                  child: Container(
                    color: Colors.white,
                    height: getHeight(index),
                    width: 141.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Visibility(
                          visible: index==0,
                          child: Text(
                            optionsList[index].title,
                            style: TextStyle(color: Colors.green, fontFamily:AppConfig.roboto,),
                          ),
                        ),
                        Image.asset(
                          getImage(index),
                          height: 44.0,
                          width: 60.0,
                        ),
                        Visibility(
                          visible: index!=0,
                          child: Text(
                            optionsList[index].title,
                            style: TextStyle(color: Colors.green, fontFamily:AppConfig.roboto,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  // ignore: missing_return
  String getImage(int index) {
    switch (index) {
      case 0:
        return Assets.videoIcon;
        break;
      case 1:
        return Assets.tempIcon;
        break;
      case 2:
        return Assets.communicate;
        break;
      case 3:
        return Assets.bigCart;
        break;
      case 4:
        return Assets.newsFeed;
        break;
      case 5:
        return Assets.scanSpot;
        break;
    }
  }

  getDrawer() {
    return Drawer(child: AppDrawer());
  }



  getHeight(int index) {
    switch (index) {
      case 0:
        return 157.0;
        break;
      case 1:
        return 124.0;
        break;
      case 2:
        return 124.0;
        break;
      case 3:
        return 177.0;
        break;
      case 4:
        return 135.0;
        break;
      case 5:
        return 122.0;
        break;
    }
  }

  Widget bottomIcon() {
    return Center(
      child: Neumorphic(
        style: NeumorphicStyle(color: Colors.transparent),
        boxShape: AppConfig.neuShape,
        child: Container(
          width: 75.0,
          height: 55.0,
          color: Colors.green,
          child: Image.asset(Assets.chat),
        ),
      ),
    );
  }

  void itemSelected(int index) {
    switch(index){
      case 0:  Navigator.push(context, MaterialPageRoute(builder: (context)=>
      VideosScreen()));;break;
      case 1:  Navigator.push(context, MaterialPageRoute(builder: (context)=>
      MonitorScreen()));;break;
      case 2:  Navigator.push(context, MaterialPageRoute(builder: (context)=>
      CommunicationSection()));break;
      case 3: Navigator.push(context, MaterialPageRoute(builder: (context)=>
          BuyAndSell()));break;
      case 4:  Navigator.push(context, MaterialPageRoute(builder: (context)
      =>DetailCommunication())); break;
      case 5: Navigator.push(context, MaterialPageRoute(builder: (context)=>
      TakePicture()));break;
    }
  }

}
