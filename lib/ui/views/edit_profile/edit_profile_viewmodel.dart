import 'package:diary_project/app/app.locator.dart';
import 'package:diary_project/app/app.router.dart';
import 'package:diary_project/ui/views/profile/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:diary_project/services/dairy_profile_service.dart';

class EditProfileViewModel extends ReactiveViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigatorService = locator<NavigationService>();
  final _diaryProfileService = locator<DairyProfileService>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  UserProfile get profile => _diaryProfileService.profile;

  @override
  void dispose() {
    super.dispose();
  }

  String? selectedProfile;

  void initiate() {
    firstName.text = profile.firstName;
    lastName.text = profile.lastName;
    middleName.text = profile.middleName;
    dateOfBirth.text = profile.dob.toLocal().toString().split(" ")[0];
    email.text = profile.email;
    phoneNumber.text = profile.number.toString();
  }

  Future<UserProfile> pickedDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2014),
        firstDate: DateTime(1),
        lastDate: DateTime.now());
    notifyListeners();
    if (picked != null) {
      dateOfBirth.text = picked.toLocal().toString().split(" ")[0];
      _diaryProfileService.updateProfile(profile);
    }
    return profile;
  }

  void updateProfile() {
    UserProfile newProfile = UserProfile(
        firstName: firstName.text,
        lastName: lastName.text,
        middleName: middleName.text,
        number: int.parse(phoneNumber.text),
        email: email.text,
        dob: DateTime.tryParse(dateOfBirth.text) ?? DateTime.now());
    _diaryProfileService.updateProfile(newProfile);

    _navigatorService.clearTillFirstAndShow(Routes.profileView);
  }

  void back() {
    _navigatorService.back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_diaryProfileService];
}
