import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/text_style.dart';

class AppTextFields extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String hintText;
  Color? fillColor = AppColors.red;
    AppTextFields(

      {super.key,
      this.inputFormatters,
      this.keyboardType,
      required this.controller,
      this.validator,
      this.onChanged,
        this.fillColor,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyle.semibold_16(AppColors.black),
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: AppStyle.normal_14(AppColors.black50),
        fillColor: Colors.blueGrey.withOpacity(0.1),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.black50)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.black50)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.black50)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.black50),
        ),
      ),
    );
  }
}
