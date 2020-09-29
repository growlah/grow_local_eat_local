import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:grow_lah/view/commuication_detail.dart';

class CommunicationSection extends StatefulWidget {
  CommunicationSection({Key key}) : super(key: key);

  @override
  _CommunicationSectionState createState() {
    return _CommunicationSectionState();
  }
}

class _CommunicationSectionState extends State<CommunicationSection> {
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
    return Scaffold(
      appBar:AppConfig.appBar('Communication',context,true),
      body: Padding(
        padding: const EdgeInsets.only(top:20.0),
        child: Container(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
              physics: ScrollPhysics(parent: ScrollPhysics()),
              itemCount: 6,
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      =>DetailCommunication()));
                    },
                    child: Neumorphic(
                      style: AppConfig.neuStyle,
                      boxShape: AppConfig.neuShape,
                      child: Container(
                        height: 150.0,width: 150.0,
                        child:Image.asset(Assets.sample1,fit: BoxFit.fill,) ,
                      ),
                    ),
                  ),
                  Text("Sample",style: TextStyle( fontFamily:AppConfig.roboto,),)
                ],
              );
              }),
        ),
      ),
    );
  }
}