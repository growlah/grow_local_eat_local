import 'package:grow_lah/model/app_drawer_model.dart';

class AppDrawerList{
  static  List<AppDrawerModel> drawerList(){
    List<AppDrawerModel>drawer=[
      AppDrawerModel(0, " My Profile"),
      AppDrawerModel(1, "Donate"),
      AppDrawerModel(2, "Settings"),
      AppDrawerModel(3, "My Orders"),
      AppDrawerModel(4, "Subscription"),
      AppDrawerModel(5, "Refer & earn"),
      AppDrawerModel(6, "LogOut"),
    ];
    return drawer;
  }
}