import 'package:goldcity/util/enum/preference_key_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedManager() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  late SharedPreferences _preferences;

  Future<void> clearAll() async {
    await _preferences.clear();
  }

  Future<void> setStringValue(PreferenceKey key, String value) async {
    await _preferences.setString(key.name, value);
  }

  Future<void> setIntegerValue(PreferenceKey key, int value) async {
    await _preferences.setInt(key.name, value);
  }

  Future<void> setBoolValue(PreferenceKey key, bool value) async {
    await _preferences.setBool(key.name, value);
  }

  String getStringValue(PreferenceKey key) =>
      _preferences.getString(key.name) ?? '';
  int getIntegerValue(PreferenceKey key) => _preferences.getInt(key.name) ?? 0;

  bool getBoolValue(PreferenceKey key) =>
      _preferences.getBool(key.name) ?? false;
}
