class WallPaperModel {
  String imgScr;

  WallPaperModel({required this.imgScr});

  static WallPaperModel fromJson(Map<String, dynamic> wallpaper) {
    return WallPaperModel(
      imgScr: wallpaper["src"]["original"],
    );
  }
}