import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';
import 'package:project/src/features/core/Profile/controllers/profile_controller.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';

class AddVehicleFormWidget extends StatelessWidget {
  const AddVehicleFormWidget({
    super.key,
    required this.formkey,
    required this.controller,
  });

  final GlobalKey<FormState> formkey;
  final ProfileVehicleController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Vehicle Type'),
                    value: controller.selectedVehicleType,
                    items: VehicleModel.vehicleTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectVehicleType(value!);
                    },
                    validator: (value) {
                      return controller.validate(
                          value, "Please select a vehicle type");
                    },
                  ),
                  const SizedBox(height: formHeight - 10),
                  TextFormField(
                    controller: controller.vehicleName,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: vehicleName,
                      hintText: vehicleName,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return controller.validate(value, "Please enter a name!");
                    },
                  ),
                  const SizedBox(height: formHeight - 10),
                  TextFormField(
                    controller: controller.vehicleRegNumber,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.numbers),
                      labelText: vehicleRegNumber,
                      hintText: vehicleRegNumber,
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      return controller.validate(
                          value, "Please enter a Reg. number!");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    final vehicle = VehicleModel(
                      vehicleType: controller.selectedVehicleType,
                      vehicleName: controller.vehicleName.text,
                      vehicleRegNumber: controller.vehicleRegNumber.text,
                    );
                    await ProfileVehicleController.instance.addVehicle(vehicle);
                    controller.clear();
                    Get.back();
                  }
                },
                child: Text(
                  save.toUpperCase(),
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
