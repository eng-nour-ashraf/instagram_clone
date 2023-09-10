class AppAssets{
  static String fontFamily = 'URW';
  static String logo = 'logo'.png;
  static String error = 'error'.png;
  static String icInstagram = 'ic_instagram'.svg;
  static String profile = 'profile'.png;
}


extension ImageExt on String {
  String get png => 'assets/icons/$this.png';
  String get svg => 'assets/icons/$this.svg';
  String get jpeg => 'assets/icons/$this.jpeg';
}