import 'package:flutter/material.dart';
import 'package:login/ui/home/home_view_model.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.network(
                'https://assets9.lottiefiles.com/packages/lf20_4asnmi1e.json'),
            Text('“Hello, ${model.email}”')
          ],
        ),
      ),
      onModelReady: (model) {
        model.getUser();
      },
    );
  }
}
