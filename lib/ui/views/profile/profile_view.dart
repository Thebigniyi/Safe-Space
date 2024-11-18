import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => viewModel.back(),
        ),
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 40,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "First Name",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.firstName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "Last Name",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.lastName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "Middle Name",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.middleName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "Number",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.number.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "Email",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.email,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: const Text(
                    "Date of Birth",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  trailing: Text(
                    viewModel.profile.dob.toLocal().toString().split(" ")[0],
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                MaterialButton(
                  height: 56.0,
                  onPressed: () => viewModel.updateProfile(),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
