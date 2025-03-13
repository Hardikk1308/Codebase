import 'package:erp_school/data/model/response/languages_model.dart';

class AppConstants {
  static const String appName = 'erp-school';
  static const String languagesCode = 'languages';
  static const String countryCode = 'countryCode';
  static const String dollarSign = '\$';


  //keys
  static const String cookie = 'accessToken';
  static const String intro = 'language';
  static const String email = 'email';
  static const String searchHistory = 'search_history';

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: '',
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: '',
      languageName: 'Arabic',
      countryCode: 'SA',
      languageCode: 'ar',
    ),
  ];
}
