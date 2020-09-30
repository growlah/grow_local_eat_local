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
        appBar: AppConfig.appBar('CHAT BOT', context, true),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  physics: ScrollPhysics(parent: ScrollPhysics()),
                  // child:Text('testest') ,
                ),
              )),
              Neumorphic(
                style: NeumorphicStyle(color: Colors.transparent),
                boxShape: AppConfig.neuShape,
                child: ListTile(
                  trailing: GestureDetector(
                    onTap: (){},
                    child: Image.asset(Assets.send,width: 20.0,height: 20.0,),
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
                  title:TextField(
                    controller: textEditingController,
                    textAlign: TextAlign.start,
                    maxLines: null,
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
}
