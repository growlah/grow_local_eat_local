
import 'package:flutter/material.dart';
import 'package:grow_lah/view/authentication.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>AuthenticationScreen()));
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.green,
      body:Center(child:
      Text(
        'Welcome to GrowLah',
        style: new TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),),
    );
  }
}