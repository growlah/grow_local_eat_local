import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/utils/bazier_clip.dart';
import 'package:grow_lah/view/notification.dart';

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
 static String roboto='RobotoRegular';
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
 static NeumorphicStyle neuStyle=NeumorphicStyle(color: Colors.grey[100]);
  static NeumorphicBoxShape neuShape= NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0)));
 static appBar(String title,BuildContext context,bool showNotification){
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
        style: TextStyle( fontFamily:AppConfig.roboto,
            fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.green),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:10.0,right: 10.0),
          child: Image.asset(Assets.stock,color: Colors.green,height: 15.0,
          width: 15.0,),
        ),
        showNotification?InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>
            NotificationScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left:10.0,right: 20.0),
            child: Image.asset(Assets.notification,color: Colors.green,
              height: 18.0,
              width: 18.0,),
          ),
        ):Container()
      ],
    );
 }
 static bgWave(BuildContext context){
   return  Image.asset(
     Assets.bg,
     height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
     fit: BoxFit.cover,
   );
 }
}