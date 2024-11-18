import 'package:country_picker/country_picker.dart';
import 'package:diary_project/app/app.locator.dart';
import 'package:diary_project/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigatorService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool isObstruct = true;
  bool isObstruct2 = true;

  void obstructText() {
    isObstruct = !isObstruct;
    notifyListeners();
  }

  void obstructText2() {
    isObstruct2 = !isObstruct2;
    notifyListeners();
  }

  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null) {
      dateofbirth.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  final List<String> gender = ["male", "female"];
  String? selectGender;

  void changeGender(String? newValue) {
    selectGender = newValue;
    notifyListeners();
  }

  void navigateBack() {
    _navigatorService.back();
  }

  void submitForm() {
    if (formKey.currentState?.validate() == true) {
      print("Sign-up successful");
      _navigatorService.navigateTo(Routes.emailConfirmationView);
    } else {
      print("Validation failed");
    }
  }

  String selectCountryCode = "+234";
  void showCountryCodePicker(BuildContext context) {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        onSelect: (Country country) {
          selectCountryCode = "+${country.phoneCode}";
          notifyListeners();
        });
  }
}
