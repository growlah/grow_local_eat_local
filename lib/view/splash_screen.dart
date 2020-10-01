
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
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
    AppConfig.hideKeyBoard();
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
      body:Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.4),
            child: Center(child: Image.asset(Assets.appLogo)),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'GrowLah',
              style: new TextStyle( fontFamily:AppConfig.roboto,
                  fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('GrowLocal EatLocal',
              style: new TextStyle( fontFamily:AppConfig.roboto,
                  fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),),
          ),
          Text('Powered by ',
            style: new TextStyle( fontFamily:AppConfig.roboto,
                fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),),
          Image.asset(Assets.bottomLogo),
        ],
      ),
    );
  }
}