import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';
import 'package:project/src/features/core/Profile/screens/profile_vehicle/profile_add_vehicle/widgets/profile_add_vehicle_form_widget.dart';

class AddNewVehiclePage extends StatelessWidget {
  AddNewVehiclePage({super.key});

  final formkey = GlobalKey<FormState>();
  final controller = Get.put(ProfileVehicleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("Add Vehicle",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white),
          padding: const EdgeInsets.all(defaultSize),
          child:
              AddVehicleFormWidget(formkey: formkey, controller: controller)),
    );
  }
}
