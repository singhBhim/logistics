import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/view/auth/driver_page.dart';
import 'package:logistics_app/view/auth/forgot_password.dart';
import 'package:logistics_app/view/auth/login.dart';
import 'package:logistics_app/view/splash_screen.dart';

late Size size; //  global variable  for media query size
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return MaterialApp(
      title: 'Logistics App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: AppColors.themeColor)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
          home: const ForgotPassword(),
    );
  }
}
