import 'package:grow_lah/model/settings_model.dart';

class SettingsList{
  static getSettingsList(){
    List<SettingsModel>settingsList=[
      SettingsModel(0,'Permissions',true),
      SettingsModel(1,'Push Notifications',true),
      SettingsModel(2,'Location Services',true),
      SettingsModel(3,'Privacy policy',false),
      SettingsModel(4,'Terms & Conditions',false),
      SettingsModel(5,'App feedback',false),
      SettingsModel(6,'Log Out',false)
    ];
    return settingsList;
  }
}