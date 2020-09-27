import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grow_lah/utils/bazier_clip.dart';
import 'package:grow_lah/view/create_feed.dart';

class AppConfig{
  static String growLah='GrowLah';
  static String enterPh='Enter Phone Number';
  static String enterOtp='Enter OTP';
  static String getOtp='GET OTP';
  static String verification='Verification';
  static String otpMsg='We will send you a One Time Password to your mobile number';
  static String otpSms='You will get a OTP via SMS';
  static String verify='VERIFY';
  static String pleaseEnterOtp='Please Enter OTP';
  static String pleaseEnterPh='Please Enter Phone Number';

  static showToast(String text) {
    Fluttertoast.showToast(
        msg: text, toastLength: Toast.LENGTH_SHORT, backgroundColor:Colors.grey);
  }
 static clippedPath(BuildContext context){
    return ClipPath(
   clipper: BezierClipper(0),
   child: Container(
     height:MediaQuery.of(context).size.height*0.25,
     decoration:  BoxDecoration(
       color: Colors.green,
       boxShadow: [
         BoxShadow(blurRadius: 10.0)
       ],
     ),
   ),
 );
 }
 static divider(){
   return Divider(
     height: 2.0,
     color: Colors.grey,
   );
 }
 static appBar(String title,BuildContext context){
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.green,size: 24,),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(Icons.notifications_none,color: Colors.green,size: 20.0,),
        )
      ],
    );
 }

}