import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  static TextStyle normal_12(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 12, fontWeight: MyFontWeight.regular);

  static TextStyle medium_12(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 12, fontWeight: MyFontWeight.medium);

  static TextStyle semibold_12(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 12, fontWeight: MyFontWeight.bold);

  static TextStyle normal_14(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 14, fontWeight: MyFontWeight.regular);

  static TextStyle medium_14(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 14, fontWeight: MyFontWeight.medium);

  static TextStyle semibold_14(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 14, fontWeight: MyFontWeight.bold);

  static TextStyle semibold_16(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 16, fontWeight: MyFontWeight.bold);

  static TextStyle normal_16(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 16, fontWeight: MyFontWeight.regular);

  static TextStyle medium_16(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 16, fontWeight: MyFontWeight.medium);

  static TextStyle semibold_18(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 18, fontWeight: MyFontWeight.bold);

  static TextStyle normal_18(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 18, fontWeight: MyFontWeight.regular);

  static TextStyle medium_18(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 18, fontWeight: MyFontWeight.medium);

  static TextStyle semibold_20(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 20, fontWeight: MyFontWeight.bold);

  static TextStyle normal_20(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 20, fontWeight: MyFontWeight.regular);

  static TextStyle medium_20(Color color) => GoogleFonts.nunitoSans(
      color: color, fontSize: 20, fontWeight: MyFontWeight.medium);




}

class MyFontWeight {
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight bold = FontWeight.w600;
}