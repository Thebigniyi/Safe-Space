import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';

import 'otp_verification_viewmodel.dart';

class OtpVerificationView extends StackedView<OtpVerificationViewModel> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtpVerificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                      "OTP Verification",
                      style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 28.0,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A 5-digit One-Time-Password has been sent to your email rahphew98@gmail.com",
                      style: TextStyle(
                          color: Color(0xff6E6E6E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: viewModel.pinController,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 60.0,
                      fieldWidth: 60.0,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12.0),
                      activeColor: Colors.blue,
                      selectedColor: Colors.blue,
                      inactiveColor: Colors.blue,
                      disabledColor: Colors.green,
                      activeFillColor: Colors.blue.shade50,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      errorBorderColor: Colors.red,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    onChanged: (value) => viewModel.pinOnChange(value),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  OtpVerificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtpVerificationViewModel();
}
