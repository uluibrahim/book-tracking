class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();
  String get logo => toPng('');
  String get logoDark => toPng('');

  String toPng(String name) => 'assets/images/$name.png';
  String toJpg(String name) => 'assets/images/$name.jpg';
  String toJpeg(String name) => 'assets/images/$name.jpeg';
  String toGif(String name) => 'assets/gif/$name.gif';
}
