import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/core/utils/loader_util.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/locator.dart';
import '../../../app/router.router.dart';
import '../../../core/data/repository/shared_prefrence_repository.dart';

class SignUpViewModel extends BaseViewModel {
  // final _navigationService = navigationService;
  // final _sharedprefRepo = sharedprefRepo;
  // final _authRepo = authRepo;
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _passwor = '';
  String _veryfiyPasswor = '';

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

  String? veryfiyPassworValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'Please Enter Reenter Password';
    }
  }

  void emailOnSave(String? val) {
    _email = val!;
  }

  void passwordOnSave(String? val) {
    _passwor = val!;
  }

  void veryfiyPassworOnSave(String? val) {
    _veryfiyPasswor = val!;
  }

  void createAccount() async {
    if (_formKey.currentState!.validate()) {
      showLoader();
      _formKey.currentState!.save();
      if (_veryfiyPasswor != _passwor) {
        BotToast.showText(text: 'Password Does Not Match');
        return;
      }
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _passwor,
        );
        locator<SharedPreferencesRepository>()
            .saveUserEmail(email: credential.user?.email ?? "");
        locator<SharedPreferencesRepository>().setLoggedIn(isLoggedIn: true);
        locator<NavigationService>().replaceWith(Routes.homeView);
        hideLoader();
      } on FirebaseAuthException catch (e) {
        hideLoader();

        if (e.code == 'weak-password') {
          BotToast.showText(text: 'The password provided is too weak.');
          log('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          BotToast.showText(text: 'The account already exists for that email.');

          log('The account already exists for that email.');
        }
      } catch (e) {
        hideLoader();
        log(e.toString());
      }
    }
  }
}
