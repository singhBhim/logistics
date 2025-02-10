import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/app_text_fields.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController newController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        text: AppStrings.forgotPassword.replaceAll('?', ''),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: size.height * 0.03),

                Text(AppStrings.emailContents,
                    style: AppStyle.semibold_16(AppColors.black)),
                SizedBox(height: size.height * 0.03),
                Text(AppStrings.emailAddress,
                    style: AppStyle.semibold_16(AppColors.black50)),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.emailAndNumber,
                  controller: newController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.numberError;
                    }
                    return null;
                  },
                ),

                SizedBox(height: size.height * 0.05),
                appButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    minWidth: size.width,
                    text: AppStrings.send)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
