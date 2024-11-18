import 'package:diary_project/app/app.locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigatorService = locator<NavigationService>();

  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();

  bool obscureText = true;

  void isobscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void onChangePage(page) {
    if (page == 0) {
      password1.clear();
      notifyListeners();
    }
    if (page == 1) {
      password2.clear();
      notifyListeners();
    }
  }

  void navigateToForgotPassword() {
    // _navigatorService.navigateTo(Routes.forgotPasswordView);
  }

  void navigateToSignUp() {
    _navigatorService.navigateTo(Routes.signUpView);
  }
}
