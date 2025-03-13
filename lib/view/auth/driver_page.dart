import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/auth_controller.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/app_text_fields.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/view/dashboard/dashboard.dart';

class DriverPage extends StatefulWidget {
  final String driverName;
  const DriverPage({super.key,required this.driverName});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController mcController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    nameController.text = widget.driverName.toString();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(text: AppStrings.driverDetails),
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

                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        // Map bodyData = {
                        //   "company_name":companyController.text.toString(),
                        //   "mc_number":mcController.text.toString().trim(),
                        //   "driver_name":nameController.text.toString().trim()
                        // };
                        _authController.addDriverDetailsAPI(context, nameController.text.toString().trim(),mcController.text.toString().trim(),companyController.text.toString());

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
