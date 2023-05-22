import 'package:flutter/material.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Navigation/screens/parking_spot_detail/parking_spot_detail_bottom_sheet.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MarkerBuilderWidget {
  final List<ParkingSpotModel> locations;
  final MapLatLng? currentLocation;
  final int? selectedMarkerIndex;
  final NavigationController navigationController;
  final int index;

  MarkerBuilderWidget({
    required this.locations,
    required this.currentLocation,
    required this.selectedMarkerIndex,
    required this.navigationController,
    required this.index,
  });

  MapMarker buildMarker(BuildContext context) {
    if (index < locations.length) {
      final bool isSelected = selectedMarkerIndex == index;
      final double markerSize = isSelected ? 40 : 25;

      return MapMarker(
        latitude: locations[index].latitude,
        longitude: locations[index].longitude,
        alignment: Alignment.bottomCenter,
        size: Size(markerSize, markerSize),
        child: InkWell(
          onTap: () {
            navigationController.selectMarker(index);
            ParkingSpotDetailScreen.buildShowModalBottomSheet(context, locations[index]);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: markerSize,
            width: markerSize,
            child: FittedBox(
              child: Icon(
                Icons.location_on,
                color: isSelected ? Colors.blue : Colors.red,
                size: 10,
              ),
            ),
          ),
        ),
      );
    } else if (index == locations.length && currentLocation != null) {
      return MapMarker(
        latitude: currentLocation!.latitude,
        longitude: currentLocation!.longitude,
        alignment: Alignment.center,
        size: const Size(25, 25),
        child: Icon(
          Icons.my_location,
          color: Colors.blue,
          size: 25,
        ),
      );
    } else {
      throw Exception('Invalid index');
    }
  }
}
