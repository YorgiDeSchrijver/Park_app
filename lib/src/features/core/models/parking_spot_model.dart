import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingSpotModel {
  final String? id;
  final latitude;
  final longitude;

  const ParkingSpotModel({
    this.id,
    required this.latitude,
    required this.longitude,
  });

  factory ParkingSpotModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ParkingSpotModel(
      id: document.id,
      latitude: data["Latitude"],
      longitude: data["Longitude"],
    );
  }
}
