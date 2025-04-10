import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static SharedPreferences? _prefs;

  static Future<SharedPreferenceManager> getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return SharedPreferenceManager._();
  }

  SharedPreferenceManager._();

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }

  Future<void> saveDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  Future<void> saveStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
