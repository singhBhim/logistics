import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_app/controller/dashboard_controler.dart';
import 'package:logistics_app/helper/app_colors.dart';
import 'package:logistics_app/helper/text_style.dart';
import 'package:logistics_app/model/get_all_order_listing.dart';
import 'package:logistics_app/view/shipment_details.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final DashboardController _dashboardController =
  Get.put(DashboardController());


  Future<void> refreshData()async{
    _dashboardController.getAllShipmentsApi(context);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      child: FutureBuilder<List<Shipment>?>(
        future: _dashboardController.getAllShipmentsApi(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    "Error: ${snapshot.error}",
                    style: AppStyle.medium_16(AppColors.red)
                ));
          } else if (snapshot.hasData) {
            return snapshot.data!.isEmpty ?
            Center(child: Text("No Shipments Found")) :

            ListView.builder(
              itemCount: snapshot.data!.length, // Shipment की लंबाई के आधार पर
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) =>
                  _allOrdersWidget(
                      context: context, shipmentList: snapshot.data![index]),
            );
          } else {
            return Center(child: Text("No Shipments Found"));
          }
        },
      ),
    );
  }

}
  Widget _allOrdersWidget(
      {required BuildContext context, required Shipment shipmentList}) =>

    Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black10),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shipment ID and Navigation Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.blueGrey,
                    ),
                    child: Icon(
                      Icons.fire_truck_sharp,
                      size: 18,
                      color: AppColors.themeColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shipment Name :".toUpperCase(),
                        style: AppStyle.medium_14(AppColors.black50)
                      ),
                      Text(
                        shipmentList.name.toString() ?? "N/A",
                        style: AppStyle.medium_14(AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ShipmentDetails(
                      shipmentId: shipmentList.id.toString(),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.black50,
                  ),
                ),
              ),
            ],
          ),
          Divider(color: AppColors.grey),

          // Shipment Status
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipment Status", style: AppStyle.medium_16(AppColors.black)),
                Container(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                  decoration: BoxDecoration(color:
                  shipmentList.driverLocation == 'transit'
                      ? AppColors.red.withOpacity(0.2)
                      : shipmentList.driverLocation == 'running'
                      ? AppColors.orange.withOpacity(0.2)
                      : shipmentList.driverLocation == 'reached'
                      ? AppColors.blue.withOpacity(0.2)
                      : AppColors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    shipmentList.driverLocation?.toString().toUpperCase() ?? "IN-TRANSIT",
                    style: AppStyle.semibold_12(
                      shipmentList.driverLocation == 'transit'
                          ? AppColors.red
                          : shipmentList.driverLocation == 'running'
                          ? AppColors.orange
                          : shipmentList.driverLocation == 'reached'
                          ? AppColors.blue
                          : AppColors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.grey),

          // Pickup & Drop Locations
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pickup Location

              Row(
                children: [
                  Icon(Icons.my_location, color: AppColors.themeColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pickup", style: AppStyle.medium_14(AppColors.black)),
                        Text(
                          shipmentList.pickupLocation ?? "Not Available",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyle.medium_14(AppColors.black50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Dots Line
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 12),
                child: Column(
                  children: List.generate(
                    2,
                        (index) => Container(
                      margin: EdgeInsets.only(top: 3),
                      height: 5,
                      width: 2,
                      color: AppColors.themeColor,
                    ),
                  ),
                ),
              ),
              // Drop Location
              Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.themeColor),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Delivery Point", style: AppStyle.medium_14(AppColors.black)),
                        Text(
                          shipmentList.dropLocation ?? "Not Available",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppStyle.medium_14(AppColors.black50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

