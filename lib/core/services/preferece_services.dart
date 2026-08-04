import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  static const String firstLaunchKey = "is_first_launch";

  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(firstLaunchKey) ?? true;
  }

  static Future<void> setFirstLaunchCompleted() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(firstLaunchKey, false);
  }

}
