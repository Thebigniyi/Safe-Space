import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Enter your email or phone number below to \nsign in to your Diary account.",
                      style: TextStyle(
                          color: Color(0xff6E6E6E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black, width: 2.0)),
                    child: TabBar(
                      onTap: (page) => viewModel.onChangePage(page),
                      indicatorColor: Colors.black,
                      labelColor: Colors.brown,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                      isScrollable: false,
                      tabs: [
                        Tab(
                          text: "Email",
                        ),
                        Tab(
                          text: "Phone Number",
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 56,
                              child: TextFormField(
                                controller: viewModel.email,
                                keyboardType: TextInputType.emailAddress,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(
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
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains("@")) {
                                    return "Please enter your email";
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 56,
                              child: TextFormField(
                                controller: viewModel.password1,
                                keyboardType: TextInputType.text,
                                obscureText: viewModel.obscureText,
                                obscuringCharacter: "*",
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(viewModel.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: viewModel.isobscureText,
                                  ),
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(
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
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 56.0,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      elevation: 5.0),
                                  child: const Text(
                                    "Sign in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: viewModel.navigateToForgotPassword,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text.rich(
                                TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(
                                        color: Color(0xff6E6E6E),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0),
                                    children: [
                                      TextSpan(
                                        text: "Sign Up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              viewModel.navigateToSignUp(),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 56,
                              child: TextFormField(
                                controller: viewModel.phoneNumber,
                                keyboardType: TextInputType.phone,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  // prefixIcon: ,
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
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
                                    return "Please enter your phone number";
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 56,
                              child: TextFormField(
                                controller: viewModel.password2,
                                keyboardType: TextInputType.text,
                                obscureText: viewModel.obscureText,
                                obscuringCharacter: "*",
                                autocorrect: false,
                                enableSuggestions: false,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(viewModel.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: viewModel.isobscureText,
                                  ),
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(
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
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 56.0,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      elevation: 5.0),
                                  child: const Text(
                                    "Sign in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: viewModel.navigateToForgotPassword,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text.rich(
                                TextSpan(
                                    text: "Don,t have an account? ",
                                    style: TextStyle(
                                        color: Color(0xff6E6E6E),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.0),
                                    children: [
                                      TextSpan(
                                        text: "Sign Up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.0),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () =>
                                              viewModel.navigateToSignUp(),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "Don't let them miss a cue",
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                        fontSize: 10.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
