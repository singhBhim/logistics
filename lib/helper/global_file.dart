import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/text_style.dart';

PreferredSizeWidget? customAppbar({required String text,Widget? leading}) => AppBar(
  leading: leading,
      title: Text(
        text,
        style: AppStyle.semibold_18(AppColors.black)
      ),
    );

/// snackBar
customSnackBar(String msg, {bool isError = false}) {
  Get.snackbar(
    '', // Empty title
    '',
    borderRadius: 6.0,
    padding: EdgeInsets.only(left: 10, right: 10,bottom: 12,top: 8),
    backgroundColor: isError ? AppColors.red : AppColors.themeColor,
    colorText: AppColors.whiteColor,
    titleText: SizedBox.shrink(), // Hide title
    messageText: Text(
      msg,
      style: TextStyle(color: AppColors.whiteColor, fontSize: 16),
    ),
  );
}

// email validator
bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  return emailRegex.hasMatch(email);
}


/// date format

String formatDateTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);

  return DateFormat("dd-MMM-yyyy hh:mma").format(dateTime);
}

String formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  return DateFormat("dd-MMM-yyyy").format(dateTime);
}



///  get initials
String getInitials(String name) {
  List<String> nameParts = name.split(" "); // नाम को स्प्लिट करें
  String initials = "";

  for (var part in nameParts) {
    if (part.isNotEmpty) {
      initials += part[0]; // पहले अक्षर को जोड़ें
    }
  }

  return initials.length >= 2 ? initials.substring(0, 2) : initials;
}


String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}
