import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/ui/splash/splash_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          LottieBuilder.network(
              'https://assets9.lottiefiles.com/packages/lf20_4asnmi1e.json')
        ]),
      ),
      onModelReady: (model) {
        model.checkLogin();
      },
    );
  }
}
