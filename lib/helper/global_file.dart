import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/text_style.dart';

PreferredSizeWidget? customAppbar({required String text}) => AppBar(

      title: Text(
        text,
        style: AppStyle.semibold_18(AppColors.black),
      ),
    );
