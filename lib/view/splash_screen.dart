import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_assets.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/view/onboarding/onboarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    inIt();
  }


  inIt(){
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()), (_)=>false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Image.asset(
        AppAssets.appLogo,width: size.width*0.6,
      ),
    );
  }
}
