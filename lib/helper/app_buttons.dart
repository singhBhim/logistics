import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';

Widget appButton(
    {void Function()? onPressed,
    required String text,
      double? minWidth,
      Color textColor = AppColors.whiteColor,
      Color bgColor = AppColors.themeColor}) {
  return MaterialButton(
    onPressed: onPressed,
    height: size.height*0.056,
    color: bgColor,
    minWidth: minWidth,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Text(
      text,
      style: AppStyle.medium_16(textColor),
    ),
  );
}
