import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/common_widgets/Parking_spot/Parking_facilities_widget.dart';
import 'package:project/src/common_widgets/Parking_spot/payment_types_widget.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/controllers/new_Parking_spot_controller.dart';
import 'package:project/src/features/core/screens/New_Parking_Spot/Widgets/new_parking_spot_form_widget.dart';

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
