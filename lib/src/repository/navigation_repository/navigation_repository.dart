

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';

class NavigationRepository extends GetxController{
  static NavigationRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ParkingSpotModel>> getAllParkingSpots() async {
    final snapshot = await _db.collection("Markers").get();
    final userData = snapshot.docs.map((e) => ParkingSpotModel.fromSnapshot(e)).toList();
    return userData;
  }
}