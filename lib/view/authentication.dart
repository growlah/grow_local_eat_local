import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/controller/authentiction_controller.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/view/home_screen.dart';
import 'package:grow_lah/view/on_boarding.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreen({Key key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() {
    return _AuthenticationScreenState();
  }
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool otpClicked = false;
  bool signUpClicked=false;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  FocusNode _focusNode=FocusNode();

  @override
  void initState() {
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
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left:20.0,bottom: 10.0,top:150.0),
                      child: Text(signUpClicked?'Welcome back':'Hello',style: TextStyle(
                          fontSize: 20.0,fontWeight: FontWeight.bold,
                          fontFamily:AppConfig.roboto,
                          color: Colors.green),)
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left:20.0,bottom: 10.0),
                      child:Text(signUpClicked?'Login !':'Sign Up!',style: TextStyle(
                          fontSize: 20.0,fontWeight: FontWeight.bold,
                          fontFamily:AppConfig.roboto,
                          color: Colors.green),)
                  ),
                  !signUpClicked?Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                      style: NeumorphicStyle(depth: -8,
                          intensity: 0.86,
                          surfaceIntensity: 0.3),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: AuthenticationController.userNameTextController,
                          textAlign: TextAlign.start,
                          autofocus: true,
                          maxLength: 10,
                          buildCounter: (BuildContext context,
                              {int currentLength,
                                int maxLength,
                                bool isFocused}) =>
                          null,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10.0),
                              hintText:"User Name",
                              hintStyle: TextStyle(color: Colors.green),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                    ),
                  ):Container(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                      style: NeumorphicStyle(depth: -8,
                          intensity: 0.86,
                          surfaceIntensity: 0.3),
                      child: Container(
                        height: 50.0,
                        child: TextField(
                          controller: AuthenticationController.emailTextController,
                          textAlign: TextAlign.start,
                          focusNode: _focusNode,
                          maxLength: 10,
                          buildCounter: (BuildContext context,
                              {int currentLength,
                                int maxLength,
                                bool isFocused}) =>
                          null,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              hintText: "Email Id",
                              hintStyle: TextStyle(color: Colors.green),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                      style: NeumorphicStyle(depth: -8,
                          intensity: 0.86,
                          surfaceIntensity: 0.3),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: AuthenticationController.passwordController,
                          textAlign: TextAlign.start,
                          maxLength: 10,
                          buildCounter: (BuildContext context,
                              {int currentLength,
                                int maxLength,
                                bool isFocused}) =>
                          null,
                          decoration: InputDecoration(
                              hintText:'Password',
                              hintStyle: TextStyle(color: Colors.green),
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          depth: 10,
                        ),
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(25.0))),
                        child: InkWell(
                          onTap: (){
                            SystemChannels.textInput.invokeMethod('TextInput.hide');
                            if(signUpClicked&&checkEmailAndPassword()){
                              if(authenticate()){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                                  OnBoardingScreen()));}
                              else{
                                AppConfig.showToast('Please enter correct email and password');
                              }
                            }
                            if(!signUpClicked){
                              if(AuthenticationController.
                              userNameTextController.text==null||
                                  AuthenticationController.userNameTextController
                                      .text.trim()==''){
                                return AppConfig.showToast('Please enter username');
                              }
                              checkEmailAndPassword();
                              setState(() {
                                AuthenticationController.userNameTextController.clear();
                                AuthenticationController.emailTextController.clear();
                                AuthenticationController.passwordController.clear();
                                FocusScope.of(context).requestFocus(_focusNode);
                                signUpClicked=true;
                              });
                            }

                          },
                          child: Container(
                            color: Colors.green,
                            height: 50.0,
                            width: 100.0,
                            child: Center(
                              child: Text(signUpClicked?'login':'Sign Up',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !signUpClicked,
                    child: Padding(
                      padding: const EdgeInsets.only(top:50.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already have an account ?',
                              style: TextStyle(color: Colors.green,
                                  fontFamily:AppConfig.roboto,
                                  fontSize: 16.0),),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  FocusScope.of(context).requestFocus(_focusNode);
                                  signUpClicked=true;
                                });
                              },
                              child: Text('Login',style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily:AppConfig.roboto,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  void sendOtp(String phNumber) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // firebaseAuth.verifyPhoneNumber(phoneNumber:phNumber,
    //     verificationCompleted: (AuthCredential credential){
    //       signInWithCredential(credential);
    //     },
    //     timeout: Duration(seconds: 60),
    //     verificationFailed: (AuthException exception){
    //   print(exception.message);
    //     },
    //     codeSent: (String verificationId, [int forceResendingToken]){
    //       _codeSent(verificationId, forceResendingToken);
    //     },
    //     codeAutoRetrievalTimeout: null);


    // setState(() {
    //   AuthenticationController.phNumberController.clear();
    //   otpClicked = true;
    // });
  }

  Future signInWithCredential(AuthCredential credential)async {
  AuthResult result=await firebaseAuth.signInWithCredential(credential);
  FirebaseUser user=result.user;
  if(user!=null){
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
  }
  }

   _codeSent(String verificationId, int forceResendingToken) {
    setState(() {
      AuthenticationController.passwordController.clear();
      otpClicked = true;
    });
    // AuthCredential credential=PhoneAuthProvider.getCredential(verificationId:
    // verificationId, smsCode: AuthenticationController.phNumberController.text.trim() );
    // signInWithCredential(credential);
  }

  verifyOtp() {}

  bool checkEmailAndPassword() {
    if(AuthenticationController.
    emailTextController.text==null||
        AuthenticationController.emailTextController
            .text.trim()==''){
       AppConfig.showToast('Please enter email');
      return false;
    }
   else if(AuthenticationController.
    passwordController.text==null||
        AuthenticationController.passwordController
            .text.trim()==''){
       AppConfig.showToast('Please enter password');
      return  false;
    }
   else return true;
  }
  bool authenticate(){
    if((AuthenticationController.
    emailTextController.text!=null&&
        AuthenticationController.emailTextController
            .text.trim().toLowerCase()=='admin')&&
        (AuthenticationController.
        passwordController.text!=null&&
            AuthenticationController.passwordController
                .text.trim().toLowerCase()=='admin')){
      return true;
    }
    else return false;
  }

}