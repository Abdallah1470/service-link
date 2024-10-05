import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/interfaces/preferences_repository.dart';
import '../../data/repositories/preferences_repository_impl.dart';

class SharedPreferencesService {
  late final PreferencesRepository _preferencesRepository;

  SharedPreferencesService(SharedPreferences sharedPreferences) {
    _preferencesRepository = PreferencesRepositoryImpl(sharedPreferences);
  }

  Future<bool> isFirstTimeLaunch() async {
    return await _preferencesRepository.isFirstTimeLaunch();
  }

  Future<void> setNotFirstTimeLaunch() async {
    await _preferencesRepository.setNotFirstTimeLaunch();
  }

  Future<bool> isLoggedIn() async {
    return await _preferencesRepository.isLoggedIn();
  }

  Future<void> setLoggedIn(bool value) async {
    await _preferencesRepository.setLoggedIn(value);
  }
}
