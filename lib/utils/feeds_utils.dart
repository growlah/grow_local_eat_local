import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grow_lah/model/feeds_model.dart';
import 'assets.dart';

class FeedsUtils{
  static getTopView(FeedsModel feedsList){
    return Container(
      height:50.0,
      child: Row(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              ClipOval(
                child: Container(
                  height: 35.0,
                  width: 35.0,
                  child: Image.asset(Assets.dot),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(feedsList.authorName??'',style: TextStyle(color: Colors.black,
                    fontSize: 14.0),),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10.0),
            child: Container(
                height: 20.0,
                width: 20.0,
                child: Image.asset(Assets.options)),
          )
        ],
      ),
    );
  }
  static getBottomView(bool isLiked){
    return Padding(
      padding: const EdgeInsets.only(left:20.0,top: 10.0,bottom: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: (){
               getColor(true);
                },
                child: Image.asset(Assets.favBlack,height: 20.0,width: 20.0,
                color: getColor(isLiked),)),
            Text('0'+' likes'),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Image.asset(Assets.favBlack,height: 20.0,width: 20.0,),
            ),
            Text('0'+' comments'),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Image.asset(Assets.favBlack,height: 20.0,width: 20.0,),
            ),
          ],
        ),
      ),
    );
  }
  static getCenterView(FeedsModel feedsList){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(feedsList.content??''),
          loadForImage(feedsList.image),
          loadForVideo()
        ],
      ),
    );
  }

  static loadForImage(String image) {
    return image!=null&&image.trim()!=''?Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150.0,
          width: 150.0,
          child: Image.network(image),
        ),
      ),
    ): Container();}

  static loadForVideo() {return Container();}

  static getColor(bool isLiked) {
    return isLiked?Colors.red:null;
  }

}