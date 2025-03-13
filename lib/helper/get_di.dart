import 'dart:convert';


import 'package:erp_school/controllers/localisation_controller.dart';
import 'package:erp_school/data/model/response/languages_model.dart';
import 'package:erp_school/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // repo


  // controller
  Get.lazyPut(() => LocalizationController(
      sharedPreferences: Get.find(),));


  Map<String, Map<String, String>> language = {};
  try {
    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringsValues = await rootBundle
          .loadString("assets/languages/${languageModel.languageCode}.json");

      Map<String, dynamic> mappedJson = jsonDecode(jsonStringsValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      language['${languageModel.languageCode}_${languageModel.countryCode}'] =
          json;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return language;
}
