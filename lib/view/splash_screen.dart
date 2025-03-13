import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_assets.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/services/db_storage.dart';
import 'package:logistics_app/view/dashboard/dashboard.dart';
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
    DbStorage dbStorage = DbStorage();
    var token = dbStorage.getToken();
    if(token!=null){
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Dashboard()), (_)=>false);
      });
    }else{
      Future.delayed(Duration(seconds: 3),(){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>OnboardingScreen()), (_)=>false);
      });
    }



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
