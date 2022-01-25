class SliderModel {
  late String imgPath;
  late String title;
  late String description;
  // SliderModel({
  //   this.imgPath,
  //   this.title,
  //   this.description,
  // });

  void setImagePath(String getImagePath) {
    imgPath = getImagePath;
  }

  void setgetTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImagePath() {
    return imgPath;
  }

  String getTitle() {
    return title;
  }

  String getdescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel slideModel = SliderModel();

  // Slider 1
  slideModel.setImagePath("assets/images/Group2182.svg");
  slideModel.setgetTitle("Subscribe events");
  slideModel.setDescription(
      "by using this app you will subscribe your event easily and quickly.");
  slides.add(slideModel);

  // Slider 2
  slideModel = SliderModel();
  slideModel.setImagePath("assets/images/Group2175.svg");
  slideModel.setgetTitle("Online payment");
  slideModel.setDescription(
      "this app provide you to pay through multiple  methods such as:  Visa, PayPal and cash.");
  slides.add(slideModel);

  // Slider 3
  slideModel = SliderModel();
  slideModel.setImagePath("assets/images/Group2176.svg");
  slideModel.setgetTitle("Create events");
  slideModel.setDescription(
      "you can create your own event in the application free and invite your friends");
  slides.add(slideModel);


  return slides;
}