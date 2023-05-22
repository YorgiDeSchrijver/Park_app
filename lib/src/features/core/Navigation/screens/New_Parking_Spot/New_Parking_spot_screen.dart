import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/common_widgets/Parking_spot/Parking_facilities_widget.dart';
import 'package:project/src/common_widgets/Parking_spot/payment_types_widget.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/Navigation/controllers/new_Parking_spot_controller.dart';
import 'package:project/src/features/core/Navigation/screens/New_Parking_Spot/Widgets/new_parking_spot_form_widget.dart';

class NewParkingSpotPage extends StatelessWidget {
  const NewParkingSpotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewParkingSpotController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            addParkingSpot,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white),
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewParkingSpotFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
