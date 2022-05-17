import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/core/data/repository/shared_prefrence_repository.dart';
import 'package:login/core/utils/loader_util.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.router.dart';

class SignInViewModel extends BaseViewModel {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  GlobalKey<FormState> get formKey => _formKey;

  String? emailValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Please Enter Email';
    }
  }

  String? passwordValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Please Enter Password';
    }
  }

  void emailOnSave(String? val) {
    _email = val!;
  }

  void passwordOnSave(String? val) {
    _password = val!;
  }

  void logIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        showLoader();
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        log(credential.toString());
        locator<SharedPreferencesRepository>()
            .saveUserEmail(email: credential.user?.email ?? "");
        locator<SharedPreferencesRepository>().setLoggedIn(isLoggedIn: true);
        locator<NavigationService>().replaceWith(Routes.homeView);

        hideLoader();
      } on FirebaseAuthException catch (e) {
        hideLoader();
        if (e.code == 'user-not-found') {
          BotToast.showText(text: "No user found for that email");
          log('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          BotToast.showText(text: "Wrong password provided for that user.");

          log('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCrid =
        await FirebaseAuth.instance.signInWithCredential(credential);
    locator<SharedPreferencesRepository>()
        .saveUserEmail(email: userCrid.user?.email ?? "");
    locator<SharedPreferencesRepository>().setLoggedIn(isLoggedIn: true);
    locator<NavigationService>().replaceWith(Routes.homeView);

    log(userCrid.toString());
  }

  void navigateToSignUp() {
    locator<NavigationService>().navigateTo(Routes.signUpView);
  }
}
