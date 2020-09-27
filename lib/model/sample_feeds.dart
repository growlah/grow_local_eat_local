import 'package:grow_lah/model/feeds_model.dart';

class SampleFeeds{
  static List<FeedsModel> feedsModel(){
    List<FeedsModel> tempModel=[
      FeedsModel(1, "user1", "FirstContent", 0, false,"test",''),
      FeedsModel(2, "user2", "testestes", 0, true,"test",'https://homepages.cae.wisc.edu/~ece533/images/airplane.png'),
      FeedsModel(3, "user3", " example hormoponics", 0,false, "test",''),
      FeedsModel(4, "user4", "test", 0,false, "test",''),
      FeedsModel(5, "user5", "gregsddgfdg", 0, false,"test",''),
      FeedsModel(6, "user6", "FirstContadgdafgent", 0, false,"test",''),
      FeedsModel(7, "user17", "FirstContent", 0, false,"test",''),
      FeedsModel(8, "user8", "FirstCosfsdfsdfdfntent", 0, false,"test",''),
      FeedsModel(9, "user9", "FirstCodfdfdfdfntent", 0,false, "test",''),
    ];
    return tempModel;
  }
}