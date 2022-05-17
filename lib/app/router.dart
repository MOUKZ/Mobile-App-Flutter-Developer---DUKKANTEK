import 'package:login/ui/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/home/home_view.dart';
import '../ui/sign_in_up/sign_in/sign_in_view.dart';
import '../ui/sign_in_up/sign_up/sign_up_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(
      initial: true,
      page: SplashView,
    ),
    CupertinoRoute(
      page: SignInView,
    ),
    CupertinoRoute(
      page: SignUpView,
    ),
    CupertinoRoute(
      page: HomeView,
    ),
  ],
)
class AppRouter {}
