import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:project/src/features/core/controllers/navigation_controller.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class NavigationMapWidget extends StatefulWidget {
  const NavigationMapWidget({Key? key}) : super(key: key);

  @override
  State<NavigationMapWidget> createState() => _NavigationMapWidgetState();
}

class _NavigationMapWidgetState extends State<NavigationMapWidget> {
  late MapTileLayerController mapController;
  int? selectedMarkerIndex; // Variable to track the selected marker index

  @override
  void initState() {
    super.initState();
    mapController = MapTileLayerController();
  }

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());

    return Obx(() {
      final List<ParkingSpotModel> locations = navigationController.parkingSpots;
      if (locations.isNotEmpty) {
        return SfMaps(
          layers: [
            MapTileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              zoomPanBehavior: MapZoomPanBehavior(
                minZoomLevel: 3,
                maxZoomLevel: 20,
                focalLatLng: MapLatLng(
                  locations[selectedMarkerIndex ?? 0].latitude,
                  locations[selectedMarkerIndex ?? 0].longitude,
                ),
                enableDoubleTapZooming: true,
              ),
              controller: mapController,
              initialMarkersCount: locations.length,
              tooltipSettings: const MapTooltipSettings(
                color: Colors.transparent,
              ),
              // MARKER BUILDER
              markerBuilder: (BuildContext context, int index) {
                final bool isSelected = selectedMarkerIndex == index;
                final double markerSize = isSelected ? 40 : 25;

                return MapMarker(
                  latitude: locations[index].latitude,
                  longitude: locations[index].longitude,
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMarkerIndex = index; // Update the selected marker index
                      });

                      // Show the bottom sheet here
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            // Add your desired content for the bottom sheet
                          );
                        },
                      );
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
                  size: Size(markerSize, markerSize),
                );
              },
            ),
          ],
        );
      }
      return Center(child: CircularProgressIndicator());
    });
  }
}
