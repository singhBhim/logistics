import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/auth_controller.dart';
import 'package:logistics_app/helper/app_assets.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';
import 'package:pinput/pinput.dart';

class PasswordOtpVerify extends StatefulWidget {
  final String email;
  const PasswordOtpVerify({super.key, required this.email});

  @override
  State<PasswordOtpVerify> createState() => _PasswordOtpVerifyState();
}

class _PasswordOtpVerifyState extends State<PasswordOtpVerify> {
  final TextEditingController _otpController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  int timer = 59;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer() {
    Timer.periodic(Duration(seconds: 1), (getTimer) {
      if (timer > 0) {
        setState(() {
          timer--;
        });
      } else {
        getTimer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 100,
        height: 65,
        textStyle: const TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
            color: AppColors.black10,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.black50)));

    return Scaffold(
      appBar: customAppbar(text: AppStrings.otpVerify),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.03),

                Image.asset(
                  AppAssets.otpImg,
                  height: size.height * 0.16,
                ),
                SizedBox(height: size.height * 0.02),
                Text(AppStrings.enterVerificationCode,
                    style: AppStyle.semibold_22(AppColors.black)),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.sentCodeEmail,
                    style: AppStyle.medium_16(AppColors.black),
                    children: [
                      TextSpan(
                          text:
                              "${widget.email.substring(0, 3)}****@****${widget.email.split('@')[1]}",
                          style: AppStyle.medium_16(AppColors.blue)),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),

                _buildOtpField(defaultPinTheme),
                SizedBox(height: size.height * 0.03),
                appButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        customSnackBar('Please enter OTP', isError: true);
                      } else {
                        Map bodyData = {
                          "email": widget.email.toString(),
                          "Otp": int.parse(_otpController.text.toString().trim())
                        };
                        _authController.passwordOtpVerifyAPI(context, bodyData);
                      }
                    },
                    minWidth: size.width,
                    text: AppStrings.verifyCode),

                // TextButton(onPressed: (){}, child: Text(AppStrings.backToLogin,style: AppStyle.medium_16(AppColors.black),)),

                SizedBox(height: size.height * 0.03),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "${AppStrings.resendCode} ${timer > 0 ? 'Resend in $timer' : ''}",
                        style: AppStyle.semibold_14(AppColors.black)),
                    timer == 0
                        ? TextButton(
                            onPressed: () {
                              Map bodyData = {
                                "email": widget.email.toString(),
                              };
                              _authController.forgotPasswordAPI(
                                  context, bodyData, true);

                              setState(() {
                                timer = 30;
                              });
                              _otpController.clear();

                              setTimer();
                            },
                            child: Text("Resend Now",
                                style: AppStyle.medium_16(AppColors.blue)))
                        : SizedBox()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpField(PinTheme defaultPinTheme) {
    return Pinput(
      length: 6,
      controller: _otpController,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (_) => const SizedBox(width: 5),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please enter otp';
        }
        return null;
      },
      onCompleted: (pin) async {},
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 30,
            height: 2,
            color: AppColors.themeColor,
          ),
        ],
      ),
    );
  }
}
