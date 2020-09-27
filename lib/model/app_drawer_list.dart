import 'package:grow_lah/model/app_drawer_model.dart';

class AppDrawerList{
  static  List<AppDrawerModel> drawerList(){
    List<AppDrawerModel>drawer=[
      AppDrawerModel(0, "Settings"),
      AppDrawerModel(1, "Profile"),
      AppDrawerModel(2, "Language"),
      AppDrawerModel(3, "Subscription"),
      AppDrawerModel(4, "LogOut"),
    ];
    return drawer;
  }
}