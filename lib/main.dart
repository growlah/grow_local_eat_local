import 'package:flutter/material.dart';
import 'package:grow_lah/view/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
    child: Center(
      child: Text(
        'Something went wrong',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }

}