import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login/ui/sign_in_up/sign_up/sign_up_view_model.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:stacked/stacked.dart';

import '../componants/custom_input_widget.dart';
import '../componants/custom_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
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
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomTextWidget(
                          title: "create",
                        ),
                        const SizedBox(height: 4),
                        const CustomTextWidget(
                          title: "Your Account",
                        ),
                        const SizedBox(
                          height: 46,
                        ),
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
                          icon: Icons.password,
                          hintText: "Password",
                          isPassword: true,
                        ),
                        const SizedBox(height: 12),
                        CustomInputWidget(
                          validator: model.veryfiyPassworValidator,
                          onSaved: model.veryfiyPassworOnSave,
                          icon: Icons.password,
                          isPassword: true,
                          hintText: "Verify Password",
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
                            model.createAccount();
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
