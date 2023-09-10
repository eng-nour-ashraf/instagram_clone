import 'package:get_storage/get_storage.dart';

class PrefController {
  GetStorage? _getStorage;

  PrefController() {
    _getStorage = GetStorage();
  }

  // is login
  bool get isLogin => _getStorage!.read('isLogin') ?? false;
  set isLogin(bool value) => _getStorage!.write('isLogin', value);

  // current locale
  String get currentLocale => _getStorage!.read('currentLocale') ?? 'ar';
  set currentLocale(String value) => _getStorage!.write('currentLocale', value);

  // current theme
  String get currentTheme => _getStorage!.read('currentTheme') ?? 'light';
  set currentTheme(String value) => _getStorage!.write('currentTheme', value);

  // user Token
  String get userToken => _getStorage!.read('userToken') ?? '';
  set userToken(String value) => _getStorage!.write('userToken', value);

  // is first time
  bool get isFirstTime => _getStorage!.read('isFirstTime') ?? true;
  set isFirstTime(bool value) => _getStorage!.write('isFirstTime', value);


}
