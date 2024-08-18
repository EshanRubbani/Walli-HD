class PhotoModel {
  String imgSrc;
  String photoName;
  PhotoModel({
    required this.imgSrc,
    required this.photoName,
  });

  static PhotoModel fromAPI2APP(Map<String, dynamic> photoMap) {
    return PhotoModel(
        imgSrc: (photoMap["src"])["portrait"], photoName: photoMap["alt"]);
  }
}
