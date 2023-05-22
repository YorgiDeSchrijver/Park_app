import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/common_widgets/Parking_spot/Parking_facilities_widget.dart';
import 'package:project/src/common_widgets/Parking_spot/payment_types_widget.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Navigation/screens/Navigation_filter/widgets/navigation_filter_payment_widget.dart';

class NavigationFilterPage extends StatelessWidget {
  const NavigationFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text("Filter", style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          GestureDetector(
            onTap: () {
              // Perform the reset action here
              // e.g., reset the filters or form fields
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                "Reset".toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.green,
                      fontSize: 18,
                      letterSpacing: 1.5,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 10),
              Obx(
                () => RangeSlider(
                  min: 0,
                  max: 30,
                  values: controller.priceRange.value,
                  onChanged: (RangeValues values) {
                    controller.priceRange.value = values;
                  },
                  onChangeEnd: (RangeValues values) {
                    // Perform any additional actions when the range values change
                  },
                  divisions: 100,
                  labels: RangeLabels(
                    controller.priceRange.value.start.round().toString(),
                    controller.priceRange.value.end.round().toString(),
                  ),
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Facilities",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 15),
              FacilityTypesWidget(controller: controller),
              SizedBox(height: 30),
              Text(
                "Payment Accepted",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              PaymentTypesWidget(controller: controller),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {controller.filterParkingSpots();},
                  child: Text(
                    "APPLY".toUpperCase(),
                    style: TextStyle(letterSpacing: 4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



