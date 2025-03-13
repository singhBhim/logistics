import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/dashboard_controler.dart';
import 'package:logistics_app/helper/api_end_points.dart';
import 'package:logistics_app/helper/app_buttons.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/app_strings.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/main.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class LoadingBill extends StatefulWidget {
  final String shipmentId;
  const LoadingBill({super.key, required this.shipmentId});

  @override
  State<LoadingBill> createState() => LoadingBillState();
}

class LoadingBillState extends State<LoadingBill> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  bool checked = false;
  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  bool isLoading = true; // Initially, set loading to true

  final DashboardController _dashboardController =
      Get.put(DashboardController());

  /// CALL TO CRETE SIGNATURE API
  callToUploadSignatureAPI() async {
    final signatureState = signatureGlobalKey.currentState;
    print('---->>>$signatureState');

    if (signatureState == null) {
      customSnackBar("Signature pad not initialized!", isError: true);
      return null;
    }

    final paths = signatureState.toPathList();
    if (paths.isEmpty) {
      customSnackBar("Please draw your signature before uploading!",
          isError: true);
      return null;
    }

    // Convert signature to image
    final image = await signatureState.toImage(pixelRatio: 3.0);
    print('image----->>>$image');

    if (image == null) {
      customSnackBar("Please create a signature before uploading!",
          isError: true);
      return null;
    }

    // Convert image to byte data
    final bytes = await image.toByteData(format: ImageByteFormat.png);
    print('bytes----->>>$bytes');

    if (bytes == null) {
      customSnackBar("Signature conversion failed!", isError: true);
      return null;
    }

    _dashboardController.uploadSignatureAPI(context,
        widget.shipmentId.toString(), 'driver', bytes.buffer.asUint8List(),
        fromCustomer: false);
  }

  @override
  void initState() {
    super.initState();

    // controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onPageStarted: (value) {
    //         setState(() {
    //           isLoading = true;
    //         });
    //       },
    //       onPageFinished: (value) {
    //         setState(() {
    //           isLoading = false;
    //         });
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse(loadBolUrl));


  }




  @override
  Widget build(BuildContext context) {

    final String loadBolUrl =
        "${ApiEndPoints.getShipmentBol}${widget.shipmentId}";
    print(loadBolUrl);
    return Scaffold(
      appBar: customAppbar(text: "Bill of Loading"),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 7,
                child: SfPdfViewer.network(
                    loadBolUrl.toString(),
                    password: 'syncfusion')),
            SizedBox(height: 15),
            Text("Signature", style: AppStyle.semibold_16(AppColors.black)),
            Stack(
              children: [
                Container(
                    height: size.height * 0.17,
                    margin: const EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.blueGrey,
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10)),
                    child: SfSignaturePad(
                        key: signatureGlobalKey,
                        backgroundColor: AppColors.blueGrey.withOpacity(0.5),
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 2.0,
                        maximumStrokeWidth: 4.0)),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 5),
                  child: GestureDetector(
                      onTap: _handleClearButtonPressed,
                      child: CircleAvatar(
                        child: Icon(Icons.undo),
                      )),
                )
              ],
            ),
            Theme(
              data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: const BorderSide(color: Colors.red, width: 1),
                  ),
                ),
              ),
              child: CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                    "I confirm that I have reviewed and accept the details provided.",
                    style: AppStyle.medium_14(AppColors.black50)),
                value: checked,
                onChanged: (newValue) {
                  setState(() {
                    checked = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            appButton(
              minWidth: size.width,
              onPressed: () async {
                if (!checked) {
                  customSnackBar('Kindly accept the checked box!',
                      isError: true);
                  return;
                }

                callToUploadSignatureAPI();
              },
              text: AppStrings.submit,
            ),
            SizedBox(height: size.height * 0.05),
          ],
        ),
      ),
    );
  }


}
