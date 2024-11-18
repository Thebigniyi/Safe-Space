import 'package:diary_project/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DairyProfileService with ListenableServiceMixin {
  UserProfile _profile = UserProfile(
      firstName: "Blessing",
      lastName: "Awotayo",
      middleName: "Daniel",
      number: 08167297033,
      email: "mmlbissybless@gmail.com",
      dob: DateTime(200, 1, 1));

  UserProfile get profile => _profile;

  void updateProfile(UserProfile profile) {
    _profile = profile;
    notifyListeners();
    print(_profile.dob);
    print("Done updating");
  }
}
