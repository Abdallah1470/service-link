import 'package:service_link/domain/interfaces/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences _prefs;

  PreferencesRepositoryImpl(this._prefs);

  @override
  Future<bool> isFirstTimeLaunch() async {
    return _prefs.getBool('first_time') ?? true;
  }

  @override
  Future<void> setNotFirstTimeLaunch() async {
    await _prefs.setBool('first_time', false);
  }

  @override
  Future<bool> isLoggedIn() async {
    return _prefs.getBool('logged_in') ?? false;
  }

  @override
  Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('logged_in', value);
  }
}
