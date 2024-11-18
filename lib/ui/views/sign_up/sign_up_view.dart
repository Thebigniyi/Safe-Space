import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StackedView<SignUpViewModel> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () => viewModel.navigateBack(),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text(
                    "Create an Account",
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "Fill the form below to create your new account.",
                    style: TextStyle(
                        color: Color(0xff6E6E6E),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.firstname,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter firstname",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your firstname";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Middle Name',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.middlename,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter middlename",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your middlename";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.lastname,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Enter lastname",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your lastname";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.dateofbirth,
                          readOnly: true,
                          onTap: () => viewModel.selectDateOfBirth(context),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  viewModel.selectDateOfBirth(context),
                              icon: Icon(Icons.calendar_month),
                            ),
                            hintText: "Enter date of birth",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your date of birth";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      DropdownButtonFormField(
                        value: viewModel.selectGender,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                        ),
                        hint: const Text(
                          "Select Genger",
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        items: viewModel.gender.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) =>
                            viewModel.changeGender(newValue),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select your gender";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.email,
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Enter email",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains("@")) {
                              return "Please enter your email";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mobile Number',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.phoneNumber,
                          keyboardType: TextInputType.phone,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () =>
                                  viewModel.showCountryCodePicker(context),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, bottom: 16.0),
                                      child: Text(
                                        viewModel.selectCountryCode,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            ),
                            hintText: "Enter Phone Number (optional)",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.password,
                          keyboardType: TextInputType.text,
                          obscureText: viewModel.isObstruct,
                          obscuringCharacter: "*",
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(viewModel.isObstruct
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: viewModel.obstructText,
                            ),
                            hintText: "Enter Password",
                            hintStyle:
                                TextStyle(fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }

                            final passwordRegExp = RegExp(
                                r'^(?=.*[A-Z])(?=.*\d)(?=.*[a-z]).{8,}$');

                            if (!passwordRegExp.hasMatch(value)) {
                              return """Password must be at least 8 characters long, 
                                        include at least one uppercase letter, one lowercase letter,
                                         and one digit""";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Confirm Password',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 56,
                        child: TextFormField(
                          controller: viewModel.confirmPassword,
                          keyboardType: TextInputType.text,
                          obscureText: viewModel.isObstruct2,
                          obscuringCharacter: "*",
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(viewModel.isObstruct2
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: viewModel.obstructText2,
                            ),
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(
                                fontSize: 15.0, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }

                            final passwordRegExp = RegExp(
                                r'^(?=.*[A-Z])(?=.*\d)(?=.*[a-z]).{8,}$');

                            if (!passwordRegExp.hasMatch(value)) {
                              return """Password must be at least 8 characters long, 
                                        include at least one uppercase letter, one lowercase letter,
                                         and one digit""";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 56.0,
                        child: ElevatedButton(
                            onPressed: () => viewModel.submitForm(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                elevation: 5.0),
                            child: const Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();
}
