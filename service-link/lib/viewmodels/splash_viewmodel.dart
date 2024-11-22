import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:service_link/core/utils/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/providers.dart';

class SplashViewModel {
  Future<int> checkStatus() async {
    final prefsService = SharedPreferencesService(await SharedPreferences.getInstance());
    bool _isFirstTimeLaunch = await prefsService.isFirstTimeLaunch();
    bool _isLoggedIn = await prefsService.isLoggedIn();

      if (_isFirstTimeLaunch) {
        return -1; // Indicates onboarding should be shown
      } else if (_isLoggedIn) {
        return 0; // Indicates main screen should be shown
      } else {
        return 1; // Indicates login screen should be shown
      }
  }
}
