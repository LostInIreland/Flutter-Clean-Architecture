import 'package:shared_preferences/shared_preferences.dart';

/// General Preferences Helper class, used for storing preference values using the Preference API
class PreferencesHelper {
  static const String PREF_KEY_LAST_CACHE = "last_cache";

  Future<SharedPreferences> _prefs  = SharedPreferences.getInstance();

  Future<void> setLastCacheTime(int cacheTime) async {
    final SharedPreferences sharedPreferences = await _prefs;
    sharedPreferences.setInt(PREF_KEY_LAST_CACHE, cacheTime);
  }

  Future<int> getLastCacheTime() async {
    final SharedPreferences sharedPreferences = await _prefs;
    int cacheTime = sharedPreferences.getInt(PREF_KEY_LAST_CACHE) ?? 0;
    return cacheTime;
  }
}