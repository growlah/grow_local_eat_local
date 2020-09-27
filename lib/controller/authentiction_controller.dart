import 'package:flutter/cupertino.dart';
import 'package:grow_lah/utils/app_config.dart';

class AuthenticationController{
  static TextEditingController passwordController=TextEditingController();
  static TextEditingController emailTextController=TextEditingController();
  static TextEditingController userNameTextController=TextEditingController();
  validatePhOtp(bool otpClicked,BuildContext context){
    if(otpClicked){
      passwordController.text.trim().isEmpty?AppConfig.showToast(AppConfig.pleaseEnterOtp):
      checkOtp();
    }
  }

  void checkOtp() {}
}