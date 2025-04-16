import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_assets.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/view/dashboard/dashboard.dart';

class QrCOdePage extends StatefulWidget {
  final String qrcodeLink;

  QrCOdePage({super.key, required this.qrcodeLink});

  @override
  State<QrCOdePage> createState() => QrCOdePageState();
}

class QrCOdePageState extends State<QrCOdePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          text: "QR CODE ",
          leading: GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => Dashboard()),
                    (route) => false);
              },
              child: Icon(Icons.arrow_back_ios))),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Spacer(),
            Text("Scan QR & Verify The Details.",
                style: AppStyle.semibold_20(AppColors.black)),
            Spacer(),
            Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(10)),
              child: FadeInImage(
                height: 220,
                width: 200,
                fit: BoxFit.cover,
                placeholder: AssetImage(AppAssets.defaultImg.toString()),
                image: NetworkImage(widget.qrcodeLink.toString()),
                imageErrorBuilder: (context, child, Stack) =>
                    Image.asset(AppAssets.defaultImg,
                        fit: BoxFit.fill),
              ),
            ),
            Spacer(),
            MaterialButton(
              minWidth: size.width,
                height: 50,
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Dashboard()),
                          (route) => false);
                },
                color: AppColors.themeColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child: Text(
                'GO TO HOME',
                style: AppStyle.semibold_16(AppColors.whiteColor)
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
