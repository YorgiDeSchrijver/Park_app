import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';
import 'package:project/src/repository/navigation_repository/navigation_repository.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class NavigationController extends GetxController {

  final RxList<ParkingSpotModel> parkingSpots = RxList<ParkingSpotModel>([]);

  final navigationRepo = Get.put(NavigationRepository());

  @override
  void onInit() {
    super.onInit();
    loadParkingSpots();
  }

  Future<void> loadParkingSpots() async {
    parkingSpots.value = await getParkingSpots();
  }

  Future<List<ParkingSpotModel>> getParkingSpots() async {
    return await navigationRepo.getAllParkingSpots();
  }
}
