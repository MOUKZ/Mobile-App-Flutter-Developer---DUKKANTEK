import 'package:login/app/locator.dart';
import 'package:login/core/data/repository/shared_prefrence_repository.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String email = '';

  void getUser() {
    email = locator<SharedPreferencesRepository>().getUserEmail();
  }
}
