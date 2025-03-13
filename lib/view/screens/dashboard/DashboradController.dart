import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController extends GetxController {
  var userData = {}.obs; // Reactive map

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');
    if (userJson != null) {
      userData.value = jsonDecode(userJson); // Update Rx variable
    }
  }

  Future<void> updateUserData(Map<String, dynamic> newUserData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userData.value = newUserData; // Update real-time
    await prefs.setString('user', jsonEncode(newUserData));
  }
}