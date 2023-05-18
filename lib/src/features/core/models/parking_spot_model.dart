import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';


class ParkingSpotModel {
  final String? id;
  final String title;
  final String location;
  final int numberOfSpots;
  final double price;
  final String startHour;
  final String endHour;
  final latitude;
  final longitude;
  final List<String> selectedFacilities;

  List<String> facilityTypes = [
    'Covered Roof',
    'Camera',
    'Overnight',
    'Charging',
    'Disabled Parking',
    'Security Guard',
    'Valet Parking',
  ];
  

  ParkingSpotModel({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.location,
    required this.numberOfSpots,
    required this.price,
    required this.startHour,
    required this.endHour,
    required this.selectedFacilities
  });

  factory ParkingSpotModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ParkingSpotModel(
      id: document.id,
      latitude: data["Latitude"],
      longitude: data["Longitude"],
      title: "LawnField Parks",
      location: "1024, Lawnfield Road, New york",
      numberOfSpots: 1,
      price: 3.00,
      startHour: DateFormat.jm().format(DateFormat("hh:mm:ss").parse("08:00:00")),
      endHour: DateFormat.jm().format(DateFormat("hh:mm:ss").parse("23:00:00")),
      selectedFacilities: [
        'Covered Roof',
        'Camera',
        'Overnight',
        'Charging',
        'Disabled Parking',
      ],
    );
  }
}
