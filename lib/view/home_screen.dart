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
import 'package:grow_lah/view/commuication_detail.dart';
import 'package:grow_lah/view/communication_section.dart';
import 'package:grow_lah/view/feeds_detail_page.dart';
import 'package:grow_lah/view/monitor_screen.dart';
import 'package:grow_lah/view/video_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          AppConfig.growLah,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        elevation: 0.0,
      ),
      drawer: getDrawer(),
      body: Container(
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
                    color: Colors.green),
              ),
            ),
            Expanded(child: mainView()),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
              child: GestureDetector(
                  onTap: (){
                    AppConfig.showToast('test');
                  },
                  child: bottomIcon()),
            )
          ],
        ),
      ),
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
        physics: ScrollPhysics(parent: ScrollPhysics()),
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
              padding: const EdgeInsets.only(top: 30.0),
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
                    width: 130.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          optionsList[index].title,
                          style: TextStyle(color: Colors.green),
                        ),
                        Image.asset(
                          getImage(index),
                          height: 50.0,
                          width: 50.0,
                        )
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
        return Assets.film;
        break;
      case 1:
        return Assets.donateNew;
        break;
      case 2:
        return Assets.temp;
        break;
      case 3:
        return Assets.sell;
        break;
      case 4:
        return Assets.communicate;
        break;
      case 5:
        return Assets.refer;
        break;
    }
  }

  getDrawer() {
    return Drawer(child: AppDrawer());
  }



  getHeight(int index) {
    switch (index) {
      case 0:
        return 160.0;
        break;
      case 1:
        return 100.0;
        break;
      case 2:
        return 130.0;
        break;
      case 3:
        return 160.0;
        break;
      case 4:
        return 110.0;
        break;
      case 5:
        return 130.0;
        break;
    }
  }

  Widget bottomIcon() {
    return Center(
      child: Container(
        height: 40.0,
        width: 60.0,
        child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.green, shadowDarkColor: Colors.black),
          boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.all(Radius.circular(5.0))),
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
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
      case 3:break;
      case 4:   Navigator.push(context, MaterialPageRoute(builder: (context)=>
      DetailCommunication())); break;
    }
  }

  void moveToPage() {

  }
}
