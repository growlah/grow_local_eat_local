import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grow_lah/utils/app_config.dart';
import 'package:grow_lah/utils/assets.dart';
import 'package:image_picker/image_picker.dart';

class ChatBot extends StatefulWidget {
  ChatBot({Key key}) : super(key: key);

  @override
  _ChatBotState createState() {
    return _ChatBotState();
  }
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController textEditingController = TextEditingController();
  File imageFile;
  int length=0;
 List<dynamic> messageList=List<dynamic>();
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
      resizeToAvoidBottomPadding:true,
        appBar: AppConfig.appBar('CHAT BOT', context, true),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: <Widget>[
               Center(
                 child: Container(
                   child: Text('Today'),
                 ),
               ),
               Flexible(
                 child: ListView.builder(
                   itemCount: messageList.length,
                   reverse: true,
                   itemBuilder: (context,index){
                     return chat(messageList[index],0);
                   },
                 ),
               ),
                AppConfig.divider(),
                Neumorphic(
                  style: NeumorphicStyle(color: Colors.transparent),
                  boxShape: AppConfig.neuShape,
                  child: ListTile(
                    trailing: GestureDetector(
                      onTap: () {
                       setState(() {
                         messageList.add(textEditingController.text);
                         textEditingController.clear();
                       });
                      },
                      child: Image.asset(
                        Assets.send,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    leading: GestureDetector(
                      onTap: () {
                        attachments();
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.green,
                        size: 20.0,
                      ),
                    ),
                    title: TextField(
                      controller: textEditingController,
                      textAlign: TextAlign.start,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(
                          color: Colors.green,
                          fontFamily: AppConfig.roboto,
                        ),
                        border: InputBorder.none,
                      ),
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void attachments() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  openCamera();
                },
                title: Center(
                    child: Text('Camera',
                        style: TextStyle(
                            fontFamily: AppConfig.roboto,
                            fontWeight: FontWeight.bold))),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  openGallery();
                },
                title: Center(
                    child: Text('Gallery',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConfig.roboto,
                        ))),
              ),
            ],
          );
        });
  }

  openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }

  openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Widget chat(String message,int data) {
    return Container(
      padding: EdgeInsets.only(left: 20.0,right: 20.0),
      child: Row(
        mainAxisAlignment: data!=0?MainAxisAlignment.start:MainAxisAlignment.end,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Neumorphic(
            style: NeumorphicStyle(color: Colors.green),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.only(
                  topLeft: Radius.circular(data!=0?0:5.0),
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                  topRight: Radius.circular(data!=0?5.0:0)
              )),
            child: Padding(padding: const EdgeInsets.all(10.0),
            child: Text(message,style: TextStyle(color:Colors.white,
            fontFamily: AppConfig.roboto),),),
          ),
        ),
        Container(
          height: 50.0,width: 50.0,
          child: CircleAvatar(backgroundImage:data!=0?
          AssetImage(Assets.appIcon):AssetImage(Assets.appLogo),),
        ),
      ],
      ),
    );
  }

}
