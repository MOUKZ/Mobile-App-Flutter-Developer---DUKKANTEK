import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login/ui/sign_in_up/componants/custom_input_widget.dart';
import 'package:login/ui/sign_in_up/componants/custom_text_widget.dart';
import 'package:login/ui/sign_in_up/sign_in/sign_in_viewmodel.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, model, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage('assets/images/BG.png'),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomTextWidget(title: 'Login To'),
                    const SizedBox(height: 4),
                    const CustomTextWidget(title: 'Your Account'),
                    const SizedBox(
                      height: 46,
                    ),
                    Form(
                      key: model.formKey,
                      child: Column(
                        children: [
                          CustomInputWidget(
                            validator: model.emailValidator,
                            onSaved: model.emailOnSave,
                            icon: Icons.email,
                            hintText: "Email",
                          ),
                          const SizedBox(height: 12),
                          CustomInputWidget(
                            validator: model.passwordValidator,
                            onSaved: model.passwordOnSave,
                            isPassword: true,
                            icon: Icons.password,
                            hintText: "Password",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    NiceButtons(
                      width: MediaQuery.of(context).size.width,
                      stretch: false,
                      borderRadius: 30,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        model.logIn();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 18),
                    NiceButtons(
                      width: MediaQuery.of(context).size.width,
                      stretch: false,
                      borderRadius: 30,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        model.signInWithGoogle();
                      },
                      child: Image.asset(
                        'assets/images/google_logo.png',
                        height: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                            onPressed: () {
                              model.navigateToSignUp();
                            },
                            child: const Text(
                              'Create A New Account',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}
