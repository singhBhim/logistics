import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/auth_controller.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/dialogs.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/model/get_driver_details.dart';
import 'package:logistics_app/services/db_storage.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  final AuthController _authController = Get.put(AuthController());

  bool isEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: [
          FutureBuilder<DriverDetails?>(
              future: _authController.fetchDriver(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.themeColor,
                        child: Text('LG',
                            style: AppStyle.medium_16(AppColors.whiteColor))),
                    title: Text("Loading...",
                        style: AppStyle.medium_16(AppColors.black)),
                    subtitle: Text("Loading...",
                        style: AppStyle.medium_14(AppColors.black)),
                  );
                } else {
                  DriverDetails data = snapshot.data!;
                  String initials =
                      getInitials(data.userResult!.name.toString());
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.themeColor,
                      child: Text(
                        initials,
                        style: AppStyle.medium_16(AppColors.whiteColor),
                      ),
                    ),
                    title: Text(data.userResult!.name.toString(),
                        style: AppStyle.medium_16(AppColors.black)),
                    subtitle: Text(data.driver!.companyName.toString(),
                        style: AppStyle.medium_14(AppColors.black)),
                  );
                }
              }),
          Divider(color: AppColors.grey),
          SizedBox(height: 8),
          _allOrdersWidget(
              context: context,
              txt: "Enabled",
              widget: GestureDetector(
                onTap: () {
                  // DbStorage dbStorage = DbStorage();
                  // dbStorage.clearAllData(context);
                },
                child: _buildSwitchRow("Enable", isEnabled, (value) {
                  isEnabled = value;
                  setState(() {});
                }),
              )),
          SizedBox(height: 15),
          _allOrdersWidget(
            context: context,
            txt: 'Logout',
            widget: GestureDetector(
              onTap: () {
                reachedLocationDialog(context, () async {
                  Navigator.pop(context);
                  EasyLoading.show(status: "Please wait...");
                  try {
                    DbStorage dbStorage = DbStorage();
                    await Future.delayed(Duration(seconds: 2));
                    await dbStorage.clearAllData(context);
                  } catch (e) {
                    EasyLoading.dismiss();
                  } finally {
                    EasyLoading.dismiss();
                  }
                }, fromProfile: true);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.grey,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.black50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _allOrdersWidget(
          {required BuildContext context, String? txt, Widget? widget}) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.black10),
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteColor),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(txt.toString(),
                    style: AppStyle.semibold_16(AppColors.black)),
                SizedBox(child: widget)
              ],
            ),
          ],
        ),
      );

  Widget _buildSwitchRow(
      String title, bool switchValue, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Transform.scale(
        scale: 0.7,
        child: CupertinoSwitch(
          activeColor: AppColors.themeColor,
          value: switchValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
