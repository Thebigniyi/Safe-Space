import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'email_confirmation_viewmodel.dart';

class EmailConfirmationView extends StackedView<EmailConfirmationViewModel> {
  const EmailConfirmationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EmailConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Verify Your Email",
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
                      "Confirm your email below to receive your OTP \nVerification code",
                      style: TextStyle(
                          color: Color(0xff6E6E6E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SizedBox(
                    height: 56,
                    child: TextFormField(
                      controller: viewModel.email,
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Email",
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
                  const SizedBox(
                    height: 32.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 56.0,
                        child: ElevatedButton(
                            onPressed: () => viewModel.navigateToOtp(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                elevation: 5.0),
                            child: const Text(
                              "Continue",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                              color: Color(0xff6E6E6E),
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
                          children: [
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => viewModel.navigateToLogin(),
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  EmailConfirmationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EmailConfirmationViewModel();
}
