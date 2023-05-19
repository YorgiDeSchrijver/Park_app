import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';

class NavigationRepository extends GetxController {
  static NavigationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ParkingSpotModel>> getAllParkingSpots() async {
    final snapshot = await _db.collection("Markers").get();
    final parkingSpotsData =
        snapshot.docs.map((e) => ParkingSpotModel.fromSnapshot(e)).toList();
    return parkingSpotsData;
  }

  Future<List<ParkingSpotModel>> filterParkingSpots(
      RangeValues rangeValues,
      List<String> selectedFacilities,
      List<String> selectedPaymentMethods) async {
    final snapshot = await _db
        .collection("Markers")
        .where("Price",
            isGreaterThan: rangeValues.start, isLessThan: rangeValues.end)
        .where("SelectedFacilities", isEqualTo: selectedFacilities)
        .where("selectedPaymentMethods",
            arrayContainsAny: selectedPaymentMethods)
        .get();
    final parkingSpotsData = snapshot.docs.map((e) => ParkingSpotModel.fromSnapshot(e)).toList();
    return parkingSpotsData;
  }

  createNewParkingSpot(ParkingSpotModel parkingSpot) async{
    await _db.collection("Markers")
        .add(parkingSpot.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Succes",
            "Your parking spot has been added.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError(
      (error, StackTrace) {
        Get.snackbar(
          "Error",
          "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      },
    );
  }
}
