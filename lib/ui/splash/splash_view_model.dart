import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/locator.dart';
import '../../app/router.router.dart';
import '../../core/data/repository/shared_prefrence_repository.dart';

class SplashViewModel extends BaseViewModel {
  void checkLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    final login = locator<SharedPreferencesRepository>().getLoggedIn();
    if (login) {
      locator<NavigationService>().replaceWith(Routes.homeView);
    } else {
      locator<NavigationService>().replaceWith(Routes.signInView);
    }
  }
}
