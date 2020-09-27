class OnBoardingModel{
  int id;
  String content;

  OnBoardingModel(this.id, this.content);
}

class OnBoardingList{
  static onBoardingList(){
    List<OnBoardingModel> onBoards=[
    OnBoardingModel(0, 'Gardening'),
    OnBoardingModel(1, 'Farming'),
    OnBoardingModel(2, 'Corp/Office'),
      ];
    return onBoards;
  }
}