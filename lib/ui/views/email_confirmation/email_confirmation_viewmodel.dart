import 'dart:developer';

import 'package:diary_project/app/app.locator.dart';
import 'package:diary_project/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigatorService = locator<NavigationService>();

  TextEditingController email = TextEditingController();

  void navigateBack() {
    _navigatorService.back();
  }

  void navigateToOtp() {
    _navigatorService.navigateTo(Routes.otpVerificationView);
  }

  void navigateToLogin() {
    _navigatorService.navigateTo(Routes.loginView);
  }
}
