import 'ar/ar_translations.dart';
import 'en/en_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': en,
    'ar': ar,
  };
}