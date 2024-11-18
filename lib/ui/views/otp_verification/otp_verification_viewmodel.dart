import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OtpVerificationViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigatorService = locator<NavigationService>();

  TextEditingController pinController = TextEditingController();

  String currentPin = "";

  void pinOnChange(value) {
    currentPin = value;
    notifyListeners();
  }

  void navigateBack() {
    _navigatorService.back();
  }
}
