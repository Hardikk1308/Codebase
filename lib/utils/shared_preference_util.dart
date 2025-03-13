import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  static SharedPreferenceUtil? _instance;
  static SharedPreferences? _preferences;

  // Private constructor
  SharedPreferenceUtil._internal();

  static Future<SharedPreferenceUtil> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferenceUtil._internal();
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  // Save a string value
  Future<void> setString(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return _preferences?.getString(key);
  }

  // Save an integer value
  Future<void> setInt(String key, int value) async {
    await _preferences?.setInt(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  // Save a boolean value
  Future<void> setBool(String key, bool value) async {
    await _preferences?.setBool(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  // Remove a specific key
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  // Clear all preferences
  Future<void> clear() async {
    await _preferences?.clear();
  }
}
