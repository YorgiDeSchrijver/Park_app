import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/src/features/core/Navigation/models/hour_model.dart';
import 'package:project/src/features/core/Navigation/models/parking_spot_model.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';
import 'package:project/src/repository/navigation_repository/navigation_repository.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';
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
  final userRepo = Get.put(UserRepository());

  final Location location = Location();
  MapLatLng? currentLocation;

  final isActive = RxBool(false);

  final RxInt selectedHourIndex = RxInt(-1);

  final List<String> hourNames = [
    "30 min",
    "1 hours",
    "2 hours",
    "4 hours",
    "8 hours",
  ];

  final List<double> hourInNumber = [
    0.5,
    1,
    2,
    4,
    8,
  ];

  @override
  void onInit() {
    super.onInit();
    listenToIsActive();
    zoomPanBehavior.value = MapZoomPanBehavior(
      focalLatLng: parkingSpots.length > 0
          ? MapLatLng(
              parkingSpots[0].latitude,
              parkingSpots[0].longitude,
            )
          : MapLatLng(51.280526, 4.413976),
      minZoomLevel: 3,
      maxZoomLevel: 20,
      zoomLevel: 14,
      enableDoubleTapZooming: true,
    );
  }

  void listenToIsActive() {
    isActive.value = Get.isRegistered<NavigationController>();
  }

  Stream<List<ParkingSpotModel>> getParkingSpots() {
    return navigationRepo.getParkingSpots().map((List<ParkingSpotModel> data) {
      parkingSpots.value = data;
      return data;
    });
  }

  Future<void> setFocalLatLng(MapLatLng focalLatLng) async {
    zoomPanBehavior.value.focalLatLng = focalLatLng;
    zoomPanBehavior.value.zoomLevel = 15;
  }

  Future<void> selectMarker(int index) async {
    selectedMarkerIndex.value = index;
    final locations = parkingSpots.value;
    final focalLatLng = MapLatLng(
      locations[selectedMarkerIndex.value].latitude - 0.003,
      locations[selectedMarkerIndex.value].longitude,
    );
    setFocalLatLng(focalLatLng);
  }

  void toggleFacility(String facilityType) {
    if (selectedFacilities.contains(facilityType)) {
      selectedFacilities.remove(facilityType);
    } else {
      selectedFacilities.add(facilityType);
    }
  }

  void togglePayment(String paymentMethod) {
    if (selectedPaymentMethods.contains(paymentMethod)) {
      selectedPaymentMethods.remove(paymentMethod);
    } else {
      selectedPaymentMethods.add(paymentMethod);
    }
  }

  void listenToParkingSpots() {
    navigationRepo
        .getParkingSpots()
        .listen((List<ParkingSpotModel> updatedParkingSpots) {
      if (isActive.value) {
        parkingSpots.assignAll(updatedParkingSpots);
      }
    });
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);
    return formattedTime;
  }

  /*void ListenToLocation() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      this.currentLocation = MapLatLng(
        currentLocation.latitude ?? 0,
        currentLocation.longitude ?? 0,
      );
    });
  }*/

  Future<void> filterParkingSpots() async {
    parkingSpots.value = await navigationRepo.filterParkingSpots(
        priceRange.value, selectedFacilities, selectedPaymentMethods);
  }

  List<HourModel> getHours(int price) {
    List<HourModel> hourModels = [];

    for (int i = 0; i < hourNames.length; i++) {
      String name = hourNames[i];
      double hourNumber = hourInNumber[i];
      int calculatedPrice = (price * hourNumber).toInt();

      HourModel hourModel = HourModel(
        name: name,
        price: calculatedPrice,
      );

      hourModels.add(hourModel);
    }

    if (selectedHourIndex.value == -1 && hourModels.isNotEmpty) {
      selectedHourIndex.value = 0;
    }

    return hourModels;
  }

  /*Future<LocationData?> getCurrentLocation() async {
    return await userRepo.currentLocation();
  }*/
}
