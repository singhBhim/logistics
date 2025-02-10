import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/app_text_fields.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newController = TextEditingController();
  TextEditingController oldController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        text: AppStrings.resetPassword,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.oldPassword,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.driverName,
                  controller: oldController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.oldError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.newPassword,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.newPassword,
                  controller: newController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.newError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.01),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.confirmPassword,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.confirmPassword,
                  controller: confirmController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.confirmError;
                    }else if(confirmController.text!=newController.text){
                      return AppStrings.confirmMatchError;
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
                    text: AppStrings.submit)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
