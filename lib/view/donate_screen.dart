import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/utils/app_config.dart';

class DonateScreen extends StatefulWidget {
  DonateScreen({Key key}) : super(key: key);

  @override
  _DonateScreenState createState() {
    return _DonateScreenState();
  }
}

class _DonateScreenState extends State<DonateScreen> {
  TextEditingController textEditingController=TextEditingController();
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
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppConfig.appBar('DONATE', context, true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Make a Donation!',style: TextStyle(
              color: Colors.green,fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Neumorphic(
                style: AppConfig.neuStyle,
                boxShape: AppConfig.neuShape,
                child: Container(
                  height: 158.0,
                  width: 365.0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Enter Amount',
                          style: TextStyle(color: Colors.green,
                          fontSize: 18.0,fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:70.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.attach_money,color: Colors.green,),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Neumorphic(
                                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(10.0))),
                                  style: NeumorphicStyle(depth: -2,
                                      intensity: 0.86,
                                      surfaceIntensity: 0.3,color: Colors.white12),
                                  child: Container(
                                    height: 50.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: TextField(
                                      controller: textEditingController,
                                      style: TextStyle(color: Colors.green,
                                      fontSize: 18.0,fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                      keyboardType:TextInputType.numberWithOptions(),
                                      maxLength: 10,
                                      buildCounter: (BuildContext context,
                                          {int currentLength,
                                            int maxLength,
                                            bool isFocused}) =>
                                      null,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: InputBorder.none
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0,left: 8.0),
              child: Text('Choose Payment Method',style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 16.0,
                color: Colors.green,
              ),),
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.radio_button_checked,color: Colors.green,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('UPI PAYMENT',style: TextStyle(color: Colors.green,
                    fontSize: 14.0,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.radio_button_unchecked,color: Colors.green,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('Credit/Debit/ATM Card',style: TextStyle(color: Colors.green,
                        fontSize: 14.0,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            AppConfig.divider(),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.radio_button_checked,color: Colors.green,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('Google Pay',style: TextStyle(color: Colors.green,
                        fontSize: 14.0,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Container(
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.radio_button_unchecked,color: Colors.green,),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text('UPI ID',style: TextStyle(color: Colors.green,
                        fontSize: 14.0,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            donateBtn()
          ],
        ),
      ),
    );
  }

  Widget donateBtn() {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Neumorphic(
        style: AppConfig.neuStyle,
        boxShape: AppConfig.neuShape,
        child: Container(
          height: 55.0,
          width: 374.0,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text('DONATE', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
      ),
    );
  }



}