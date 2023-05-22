import 'package:flutter/material.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Navigation/screens/widgets/navigation_markerbuilder_widget.dart';
import 'package:syncfusion_flutter_maps/maps.dart';


class NavigationMapWidget extends StatefulWidget {
  const NavigationMapWidget({Key? key}) : super(key: key);

  @override
  State<NavigationMapWidget> createState() => _NavigationMapWidgetState();
}

class _NavigationMapWidgetState extends State<NavigationMapWidget> {
  MapTileLayerController? mapController;
  int? selectedMarkerIndex; // Variable to track the selected marker index
  final navigationController = NavigationController();

  @override
  void initState() {
    super.initState();
    mapController = MapTileLayerController();
    //navigationController.getCurrentLocation();
    
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ParkingSpotModel>>(
      key: UniqueKey(),
      stream: navigationController.getParkingSpots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final locations = snapshot.data!;
          return SfMaps(
            layers: [
              MapTileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                zoomPanBehavior: navigationController.zoomPanBehavior.value,
                controller: mapController,
                initialMarkersCount: locations.length, 
                tooltipSettings: const MapTooltipSettings(
                  color: Colors.transparent,
                ),
                markerBuilder: (BuildContext context, int index) {
                  return MarkerBuilderWidget(
                    locations: locations,
                    currentLocation: navigationController.currentLocation,
                    selectedMarkerIndex: selectedMarkerIndex,
                    navigationController: navigationController,
                    index: index,
                  ).buildMarker(context);
                },
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

