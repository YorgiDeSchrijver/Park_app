import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Navigation/screens/parking_spot_booking/parking_spot_booking_page.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';

class ParkingSpotDetailScreen {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, ParkingSpotModel parkingSpot) {
    final controller = Get.put(ProfileVehicleController());
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize),
              topRight: Radius.circular(defaultSize))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              parkingSpot.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 5.0),
            Text(
              parkingSpot.location,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions,
                        size: 20,
                        color: accentColor.withOpacity(0.7),
                      ),
                      const SizedBox(width: 7.5),
                      Text("750" + "m",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_parking,
                        size: 20,
                        color: accentColor.withOpacity(0.7),
                      ),
                      const SizedBox(width: 7.5),
                      Text("${parkingSpot.numberOfSpots} Spots",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.euro,
                        size: 20,
                        color: accentColor.withOpacity(0.7),
                      ),
                      const SizedBox(width: 7.5),
                      Text("\$${parkingSpot.price}/h",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              workingHours,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5.0),
            Text(
                "${parkingSpot.startHour.toLowerCase()} - ${parkingSpot.endHour.toLowerCase()}"),
            const SizedBox(height: 20.0),
            Text(
              info,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5.0),
            Text("Lorem ipsom"),
            const SizedBox(height: 20.0),
            Text(
              faculties,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10.0),
            Column(
              children: <Widget>[
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: parkingSpot.selectedFacilities.map(
                    (facilityType) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          facilityType,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.fetchUserVehicles();

                  if (controller.userVehicles.isNotEmpty) {
                    Get.to(ParkingSpotBookingPage(parkingSpot: parkingSpot, profileVehicleController: controller));
                  }
                },
                child: Text(bookSpot.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
