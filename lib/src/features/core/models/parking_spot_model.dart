import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:intl/intl.dart';


class ParkingSpotModel {
  final String? id;
  final String title;
  final String location;
  final String numberOfSpots;
  final String price;
  final String startHour;
  final String endHour;
  final latitude;
  final longitude;
  final List<dynamic> selectedFacilities;
  final List<dynamic> paymentMethods;

  static 
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
    required this.selectedFacilities,
    required this.paymentMethods,
  });

  toJson(){
    return {
      "Title": title,
      "Location": location,
      "NumberOfSpots": numberOfSpots,
      "Price": price,
      "StartHour": startHour,
      "EndHour": endHour,
      "SelectedFacilities": selectedFacilities,
      "PaymentMethods": paymentMethods,
      "Latitude": latitude,
      "Longitude": longitude,
    };
  }

  factory ParkingSpotModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ParkingSpotModel(
      id: document.id,
      latitude: data["Latitude"],
      longitude: data["Longitude"],
      title: data["Title"],
      location: data["Location"],
      numberOfSpots: data["NumberOfSpots"],
      price: data["Price"],
      startHour: data["StartHour"],
      endHour: data["EndHour"],
      selectedFacilities: data["SelectedFacilities"],
      paymentMethods: data["PaymentMethods"],
    );
  }
}
