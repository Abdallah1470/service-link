abstract class PreferencesRepository {

  Future<bool> isFirstTimeLaunch();

  Future<void> setNotFirstTimeLaunch();

  Future<bool> isLoggedIn();

  Future<void> setLoggedIn(bool value);
}
