import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/model/settings_list.dart';
import 'package:grow_lah/model/settings_model.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  List<SettingsModel>settingsList=List<SettingsModel>();
  @override
  void initState() {
    settingsList=SettingsList.getSettingsList();
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
      appBar: AppConfig.appBar('SETTINGS', context,true),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: ListView.builder(
              scrollDirection: Axis.vertical,
            physics: ScrollPhysics(parent: ScrollPhysics()),
            itemCount: settingsList.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(15.0),
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
                            Text(settingsList[index].title, style: TextStyle(
                                fontFamily:AppConfig.roboto,color: Colors.green,fontSize: 16.0
                            ),),
                           settingsList[index].isChecked?
                               Image.asset(Assets.checkedIcon):Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
            }),
      ),
    );
  }
}