import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/app_text_fields.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/view/auth/reset_password.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController mcController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        text: AppStrings.driverDetails,
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
                    child: Text(AppStrings.driverName,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.driverName,
                  controller: nameController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.driverError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.companyName,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.companyName,
                  controller: companyController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.companyError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.01),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.mcNumber,
                        style: AppStyle.semibold_16(AppColors.black50))),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                  hintText: AppStrings.mcNumber,
                  controller: mcController,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return AppStrings.mcNumberError;
                    }
                    return null;
                  },
                ),

                SizedBox(height: size.height * 0.05),
                appButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ResetPassword()));
                      }
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
