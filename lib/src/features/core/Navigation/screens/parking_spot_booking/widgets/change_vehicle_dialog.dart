import 'package:flutter/material.dart';
import 'package:project/src/features/core/Profile/controllers/profile_vechicle_controller.dart';

class ChangeVehicleDialog {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, ProfileVehicleController controller) {
    final vehicles = controller.userVehicles;
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 4 * 3,
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16),
                ),
                subtitle: Text(
                  '${vehicle.vehicleType} | ${vehicle.vehicleRegNumber.toUpperCase()}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w100),
                ),
                onTap: () {
                  Navigator.pop(context);
                  controller.onVehicleSelected(vehicle);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
