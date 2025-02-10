import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_assets.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/app_text_fields.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checked = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.035),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(AppAssets.loginImg,
                        height: size.height * 0.35,
                        width: double.infinity,
                        fit: BoxFit.cover)),
                Text(
                  AppStrings.loginToYourAccount,
                  style: AppStyle.semibold_22(AppColors.themeColor)
                ),
                Text(
                  AppStrings.enterYourDetails,
                  style: AppStyle.medium_14(AppColors.black50)
                ),
                SizedBox(height: size.height * 0.03),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.enterYourNumber,
                      style: AppStyle.semibold_16(AppColors.black50),
                    )),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                    hintText: AppStrings.emailAndNumber,
                    controller: emailController,
                  validator: (v){
                      if(v==null || v.isEmpty){
                        return AppStrings.numberError;
                      }
                      return null;
                },),
                SizedBox(height: size.height * 0.02),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.password,
                      style: AppStyle.semibold_16(AppColors.black50)
                    )),
                SizedBox(height: size.height * 0.01),
                AppTextFields(
                    hintText: AppStrings.password,
                    controller: passwordController,  validator: (v){
                  if(v==null || v.isEmpty){
                    return AppStrings.passwordError;
                  }
                  return null;
                },),
            
                SizedBox(height: size.height * 0.005),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppStyle.semibold_18(AppColors.themeColor)
                    )),
                SizedBox(height: size.height * 0.02),
                Theme(
                  data: Theme.of(context).copyWith(
                    checkboxTheme: CheckboxThemeData(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                        side:
                        const BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                  ),
                  child: CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Please confirm that you agree to our terms and condition and privacy Policy ",
                      style: AppStyle.medium_14(AppColors.black50)
                    ),
                    value: checked,
                    onChanged: (newValue) {
                      setState(() {
                        checked = newValue!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                appButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
            
                  }
                },
                    minWidth: size.width,
                    text: AppStrings.login)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
