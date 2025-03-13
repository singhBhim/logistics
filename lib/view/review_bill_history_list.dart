import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/dashboard_controler.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/model/get_all_order_listing.dart';
import 'package:logistics_app/view/review_bill_history_viewer.dart';

class ReviewBillHistoryList extends StatefulWidget {
  const ReviewBillHistoryList({super.key});

  @override
  State<ReviewBillHistoryList> createState() => _ReviewBillHistoryListState();
}

class _ReviewBillHistoryListState extends State<ReviewBillHistoryList> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  Future<void> refreshData() async {
    await _dashboardController.getShipmentsHistoryApi(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(text: 'Review Bills History'),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder<List<Shipment>?>(
            future: _dashboardController.getShipmentsHistoryApi(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: AppStyle.medium_16(AppColors.red),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => _allOrdersWidget(
                    context: context,
                    data: snapshot.data![index],
                  ),
                );
              } else {
                return const Center(child: Text("No Shipments Found"));
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _allOrdersWidget(
    {required BuildContext context, required Shipment data}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.black10),
      borderRadius: BorderRadius.circular(8),
      color: AppColors.whiteColor,
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
      leading: CircleAvatar(
        child:
            Icon(Icons.fire_truck_sharp, size: 18, color: AppColors.themeColor),
      ),
      title: Text("Shipment Name :".toUpperCase(),
          style: AppStyle.medium_14(AppColors.black50)),
      subtitle: Text(data.name.toString().toUpperCase(),
          style: AppStyle.medium_14(AppColors.black)),
      trailing: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ReviewBillHistoryViewer(
                      bol: data.uploadedBol.toString())));
        },
        child: CircleAvatar(
          backgroundColor: AppColors.grey,
          child:
              Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.black50),
        ),
      ),
    ),
  );
}
