import 'package:flutter/material.dart';
import 'package:logistics_app/helper/global_file.dart';
import 'package:logistics_app/main.dart';
import 'package:logistics_app/view/view_all_orders/order_list.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppbar(text: "All Orders"),

    body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
      child: OrderList(),
    ));
  }
}
