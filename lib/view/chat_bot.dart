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
        appBar: AppConfig.appBar('CHAT BOT', context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(parent: ScrollPhysics()),
                  // child:Text('testest') ,
                ),
              )),
              Neumorphic(
                boxShape: AppConfig.neuShape,
                style:AppConfig.neuStyle,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height:textEditingController.text.length>20?100: 50.0,
                    child: TextField(
                      controller: textEditingController,
                      textAlign: TextAlign.start,
                      maxLines: null,
                      buildCounter: (BuildContext context,
                          {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                      null,
                      decoration: InputDecoration(
                          hintText:'Type a message',
                          hintStyle: TextStyle(color: Colors.green,),
                          border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: (){},
                          child: Image.asset(Assets.send,width: 20.0,height: 20.0,),
                        ),
                        prefixIcon: GestureDetector(
                          onTap: (){
                            attachments();
                          },
                          child: Icon(Icons.add,color: Colors.green,size: 20.0,),
                        ),
                        contentPadding: const EdgeInsets.all(10.0)
                      ),

                    ),
                  ),
                ),
              ),
              // Neumorphic(
              //   boxShape: AppConfig.neuShape,
              //   style: AppConfig.neuStyle,
              //   child: Container(
              //     height: textEditingController.text.length > 20 ? 100 : 50,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //     ),
              //     margin: EdgeInsets.only(left: 10.0, right: 10.0),
              //     child: TextField(
              //       controller: textEditingController,
              //       keyboardType: TextInputType.multiline,
              //       textInputAction: TextInputAction.done,
              //       maxLines: null,
              //       maxLength: 10000,
              //       buildCounter: (BuildContext context,
              //               {int currentLength,
              //               int maxLength,
              //               bool isFocused}) =>
              //           null,
              //       decoration: InputDecoration(
              //           hintText: 'Type a message',
              //           hintStyle: TextStyle(
              //             color: Colors.green,
              //           ),
              //           contentPadding: EdgeInsets.all(10.0),
              //           border: InputBorder.none,
              //           suffixIcon: GestureDetector(
              //             onTap: () {},
              //             child: Image.asset(
              //               Assets.send,
              //               width: 20.0,
              //               height: 20.0,
              //             ),
              //           ),
              //           prefixIcon: GestureDetector(
              //             onTap: () {
              //               attachments();
              //             },
              //             child: Icon(
              //               Icons.add,
              //               color: Colors.green,
              //               size: 20.0,
              //             ),
              //           )),
              //     ),
              //   ),
              // )
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
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              AppConfig.divider(),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  openGallery();
                },
                title: Center(
                    child: Text('Gallery',
                        style: TextStyle(fontWeight: FontWeight.bold))),
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