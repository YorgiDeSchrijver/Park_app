import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';
import 'package:project/src/features/core/Profile/screens/profile_vehicle/profile_add_vehicle/profile_add_vehicle_screen.dart';

class ProfileVehiclePage extends StatelessWidget {
  ProfileVehiclePage({super.key});

  final ProfileVehicleController controller = Get.put(ProfileVehicleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Name person and image person
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultSize),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Vehicles',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Vehicles you own',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color.fromARGB(255, 66, 181, 70),
                ),
                child: Column(
                  children: [
                    // Wallet
                    InkWell(
                      onTap: () => Get.to(() => AddNewVehiclePage()),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultSize + 5),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                LineAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              SizedBox(width: 30.0),
                              Text(
                                "Add new Vehicle".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade100,
                      ),
                      child: Obx(() {
                        final vehicles = controller.userVehicles;

                        if (vehicles.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.all(defaultSize),
                            child: Center(
                              child: Text(
                                'No vehicles found',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }
                        return SizedBox(
                          height: MediaQuery.of(context).size.height/4*3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: vehicles.length,
                              itemBuilder: (context, index) {
                                final vehicle = vehicles[index];
                                return ListTile(
                                  title: Text(
                                    vehicle.vehicleName,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    '${vehicle.vehicleType} | ${vehicle.vehicleRegNumber.toUpperCase()}',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w100),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
