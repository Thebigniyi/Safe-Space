import 'package:diary_project/app/app.router.dart';
import 'package:diary_project/services/dairy_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ProfileViewModel extends ReactiveViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _navigatorService = locator<NavigationService>();
  final _diaryProfileService = locator<DairyProfileService>();

  UserProfile get profile => _diaryProfileService.profile;

  void updateProfile() {
    _navigatorService.navigateTo(Routes.editProfileView);
  }

  void back() {
    _navigatorService.back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_diaryProfileService];
}

class UserProfile {
  String firstName;
  String lastName;
  String middleName;
  int number;
  String email;
  DateTime dob;
  UserProfile(
      {required this.firstName,
      required this.lastName,
      required this.middleName,
      required this.number,
      required this.email,
      required this.dob});
}
