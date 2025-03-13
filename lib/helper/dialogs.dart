
import 'package:flutter/material.dart';
import 'package:logistics_app/helper/app_colors.dart';

/// CANCEL SHIPMENT DIALOG
void cancelShipmentDialog(BuildContext context,void Function()? onTap) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Are you sure you want to cancel this shipment!',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text('CANCEL',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                      'YES',
                        style:  TextStyle(
                            color: AppColors.themeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );




/// REACHED LOCATION SHIPMENT DIALOG
void reachedLocationDialog(BuildContext context,void Function()? onTap,{bool fromProfile = false}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text('Are you sure you want to ${fromProfile?"Logout this app!":"reached the customer location!"}',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text('CANCEL',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        'YES',
                        style:  TextStyle(
                            color: AppColors.themeColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );