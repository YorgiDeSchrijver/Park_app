import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/common_widgets/Parking_spot/payment_types_widget.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';
import 'package:project/src/features/core/Navigation/models/hour_model.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Navigation/screens/parking_spot_booking/widgets/change_vehicle_dialog.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';

class ParkingSpotBookingPage extends StatelessWidget {
  ParkingSpotBookingPage(
      {super.key,
      required this.parkingSpot,
      required this.profileVehicleController});

  final ParkingSpotModel parkingSpot;

  final navController = Get.put(NavigationController());
  final ProfileVehicleController profileVehicleController;

  @override
  Widget build(BuildContext context) {
    final hours = navController.getHours(parkingSpot.price);
    profileVehicleController.fetchUserVehicles();
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
                          parkingSpot.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          parkingSpot.location,
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
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(defaultSize),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Select Vehicle",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ChangeVehicleDialog.buildShowModalBottomSheet(
                                  context, profileVehicleController);
                            },
                            child: Text(
                              'Change',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.green, letterSpacing: 1.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Obx(() {
                        final selectedVehicle =
                            profileVehicleController.selectedVehicle;
                        return ListTile(
                          title: Text(
                            selectedVehicle.value!.vehicleName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 16),
                          ),
                          subtitle: Text(
                            '${selectedVehicle.value!.vehicleType} | ${selectedVehicle.value!.vehicleRegNumber.toUpperCase()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w100),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 15,
                      ),

                      // Select hours
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Select Hours",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.av_timer,
                            color: Colors.green,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Now - ${navController.getCurrentTime()}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Colors.green, letterSpacing: 1.5),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: hours.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Obx(() {
                              final hour = hours[index];
                              final bool isSelected =
                                  navController.selectedHourIndex.value ==
                                      index;

                              return GestureDetector(
                                onTap: () {
                                  navController.selectedHourIndex.value = index;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 0, defaultSize - 10, 0),
                                  child: Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: isSelected
                                          ? Colors.green
                                          : Colors.grey.shade100,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          defaultSize - 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            hour.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : null,
                                                ),
                                          ),
                                          Text(
                                            "\$ ${hour.price}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : null,
                                                ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Select Hours",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      PaymentTypesWidget(controller: navController),

                      const SizedBox(
                        height: 130,
                      ),

                      Obx(() {
                        final price = hours[navController.selectedHourIndex.value]
                                      .price
                                      .toString();
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "PAY € ".toUpperCase() +
                                  price,
                              style: TextStyle(letterSpacing: 4),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
