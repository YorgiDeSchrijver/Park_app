import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';
import 'package:project/src/repository/navigation_repository/navigation_repository.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class NavigationController extends GetxController {
  final RxList<ParkingSpotModel> parkingSpots = RxList<ParkingSpotModel>([]);
  final Rx<MapLatLng> selectedMarkerLatLng = Rx<MapLatLng>(MapLatLng(51, 4.5));
  final zoomPanBehavior = MapZoomPanBehavior().obs;
  final mapController = MapTileLayerController();
  final selectedMarkerIndex = RxInt(0);

  final RxList<String> selectedFacilities = <String>[].obs;
  final RxList<String> selectedPaymentMethods = <String>[].obs;
  final Rx<RangeValues> priceRange = RangeValues(0, 15).obs;

  final navigationRepo = Get.put(NavigationRepository());

  @override
  void onInit() {
    super.onInit();
    loadParkingSpots();
    zoomPanBehavior.value = MapZoomPanBehavior(
      focalLatLng: parkingSpots.length > 0
          ? MapLatLng(
              parkingSpots[0].latitude,
              parkingSpots[0].longitude,
            )
          : MapLatLng( 51.280526, 4.413976),
      minZoomLevel: 3,
      maxZoomLevel: 20,
      zoomLevel: 14,
      enableDoubleTapZooming: true,
    );
  }

  Future<void> loadParkingSpots() async {
    parkingSpots.value = await getParkingSpots();
  }

  Future<List<ParkingSpotModel>> getParkingSpots() async {
    return await navigationRepo.getAllParkingSpots();
  }

  Future<void> setFocalLatLng(MapLatLng focalLatLng) async {
    zoomPanBehavior.value.focalLatLng = focalLatLng;
    zoomPanBehavior.value.zoomLevel = 15;
  }

  Future<void> selectMarker(int index) async {
    selectedMarkerIndex.value = index;
    final locations = parkingSpots.value;
    final focalLatLng = MapLatLng(
      locations[selectedMarkerIndex.value].latitude - 0.005,
      locations[selectedMarkerIndex.value].longitude,
    );
    setFocalLatLng(focalLatLng);
  }

  void toggleFacility(String facilityType){
    if (selectedFacilities.contains(facilityType)) {
      selectedFacilities.remove(facilityType);
    } else {
      selectedFacilities.add(facilityType);
    }
  }

  void togglePayment(String paymentMethod){
    if (selectedPaymentMethods.contains(paymentMethod)) {
      selectedPaymentMethods.remove(paymentMethod);
    } else {
      selectedPaymentMethods.add(paymentMethod);
    }
  }

  Future<void> filterParkingSpots() async{
    parkingSpots.value = await navigationRepo.filterParkingSpots(priceRange.value, selectedFacilities, selectedPaymentMethods);
  }
}
