import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/locator.dart';

class SharedPreferencesRepository {
  static const String PREF_TYPE_BOOL = "BOOL";
  static const String PREF_TYPE_INTEGER = "INTEGER";
  static const String PREF_TYPE_DOUBLE = "DOUBLE";
  static const String PREF_TYPE_STRING = "STRING";

  static const String PREF_IS_LOGGED_IN = "IS_LOGGED_IN";

  static const String EMAIL = "email";

  SharedPreferences? _preferences;

  static final SharedPreferencesRepository _instance =
      SharedPreferencesRepository._internal();

  factory SharedPreferencesRepository() => _instance;

  SharedPreferencesRepository._internal() {
    _preferences = locator<SharedPreferences>();
  }
  void saveUserEmail({required String email}) {
    _setPreference(
        prefName: EMAIL, prefValue: email, prefType: PREF_TYPE_STRING);
  }

  String getUserEmail() {
    if (_preferences!.containsKey(EMAIL)) {
      return _preferences!.getString(EMAIL)!;
    } else {
      return 'No Email';
    }
  }

  void setLoggedIn({required bool isLoggedIn}) => _setPreference(
      prefName: PREF_IS_LOGGED_IN,
      prefValue: isLoggedIn,
      prefType: PREF_TYPE_BOOL);

  bool getLoggedIn() {
    if (_preferences!.containsKey(PREF_IS_LOGGED_IN)) {
      return _preferences!
          .getBool(SharedPreferencesRepository.PREF_IS_LOGGED_IN)!;
    } else {
      return false;
    }
  }

  Future<void> clear() async {
    _preferences!.clear();
    locator.reset();
    await setupLocator();
  }

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------

  void _setPreference(
      {required String prefName,
      required dynamic prefValue,
      required String prefType}) {
    // Make switch for Preference Type i.e. Preference-Value's data-type
    switch (prefType) {
      // prefType is bool
      case PREF_TYPE_BOOL:
        {
          _preferences!.setBool(prefName, prefValue);
          break;
        }
      // prefType is int
      case PREF_TYPE_INTEGER:
        {
          _preferences!.setInt(prefName, prefValue);
          break;
        }
      // prefType is double
      case PREF_TYPE_DOUBLE:
        {
          _preferences!.setDouble(prefName, prefValue);
          break;
        }
      // prefType is String
      case PREF_TYPE_STRING:
        {
          _preferences!.setString(prefName, prefValue);
          break;
        }
    }
  }

  // dynamic _getPreference({@required prefName}) => _preferences.get(prefName);
}
