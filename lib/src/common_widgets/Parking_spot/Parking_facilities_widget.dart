import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/controllers/navigation_controller.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';

class FacilityTypesWidget extends StatelessWidget {
  const FacilityTypesWidget({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ParkingSpotModel.facilityTypes.map(
        (facilityType) {
          return GestureDetector(
            onTap: () {
              controller.toggleFacility(facilityType);
            },
            child: Obx(() {
              bool isTapped =
                  controller.selectedFacilities.contains(facilityType);
              return Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  color: isTapped ? Colors.green : Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  facilityType,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isTapped ? Colors.white : Colors.black87),
                ),
              );
            }),
          );
        },
      ).toList(),
    );
  }
}
