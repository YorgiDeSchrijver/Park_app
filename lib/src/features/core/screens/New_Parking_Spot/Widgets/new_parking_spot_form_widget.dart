import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/common_widgets/Parking_spot/Parking_facilities_widget.dart';
import 'package:project/src/common_widgets/Parking_spot/payment_types_widget.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/controllers/new_Parking_spot_controller.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';

class NewParkingSpotFormWidget extends StatefulWidget {
  NewParkingSpotFormWidget({Key? key}) : super(key: key);

  @override
  State<NewParkingSpotFormWidget> createState() =>
      _NewParkingSpotFormWidgetState();
}

class _NewParkingSpotFormWidgetState extends State<NewParkingSpotFormWidget> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(NewParkingSpotController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight - 14),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Details",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: formHeight - 10),
            TextFormField(
              controller: controller.title,
              decoration: const InputDecoration(
                label: Text(title),
                prefixIcon: Icon(LineAwesomeIcons.heading),
              ),
              validator: (value) {
                return controller.validate(value, "Enter a title!");
              },
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.location,
              decoration: const InputDecoration(
                label: Text(location),
                prefixIcon: Icon(LineAwesomeIcons.map_marked),
              ),
              validator: (value) {
                return controller.validate(value, "Enter a location!");
              },
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.numberOfSpots,
              decoration: const InputDecoration(
                label: Text(numberOfSpots),
                prefixIcon: Icon(LineAwesomeIcons.parking),
              ),
              validator: (value) {
                return controller.validate(value, "Enter a value!");
              },
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.price,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(price),
                prefixIcon: Icon(LineAwesomeIcons.euro_sign),
              ),
              validator: (value) {
                return controller.validate(value, "Enter a price!");
              },
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              readOnly: true,
              controller: controller.startHour,
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.hourglass_start),
                label: Text(startHour),
              ),
              validator: (value) {
                return controller.validate(value, "Enter a start hour!");
              },
              onTap: () {
                controller.selectTime(context, controller.startHour);
              },
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              readOnly: true,
              controller: controller.endHour,
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.hourglass_end),
                label: Text(endHour),
              ),
              onTap: () {
                controller.selectTime(context, controller.endHour);
              },
              validator: (value) {
                return controller.validate(value, "Enter a end hour!");
              },
            ),
            SizedBox(height: 20),
            Text(
              "Available facilities",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FacilityTypesWidget(controller: controller),
            SizedBox(height: 20),
            Text(
              "Payment Accepted",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PaymentTypesWidget(controller: controller),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    List<Location> locations =
                        await locationFromAddress(controller.location.text);
                    final parkingSpot = ParkingSpotModel(
                      latitude: locations[0].latitude,
                      longitude: locations[0].longitude,
                      title: controller.title.text,
                      location: controller.location.text,
                      numberOfSpots: controller.numberOfSpots.text,
                      price: controller.price.text,
                      startHour: controller.startHour.text,
                      endHour: controller.endHour.text,
                      selectedFacilities: controller.selectedFacilities.value,
                      paymentMethods: controller.selectedPaymentMethods.value,
                    );

                    NewParkingSpotController.instance
                        .createNewParkingSpot(parkingSpot);
                    controller.clear();
                  }
                },
                child: Text(
                  "Add parking spot".toUpperCase(),
                  style: TextStyle(letterSpacing: 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
