import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final List<VehicleModel>? vehicles;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
    this.vehicles,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "Vehicles": vehicles,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    final List<dynamic>? vehicleDataList = data["Vehicles"];
    final List<VehicleModel>? vehicles = vehicleDataList != null
      ? vehicleDataList
          .map((vehicleData) => VehicleModel(
                vehicleType: vehicleData['VehicleType'],
                vehicleName: vehicleData['VehicleName'],
                vehicleRegNumber: vehicleData['VehicleRegNumber'],
              ))
          .toList()
      : null;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      fullName: data["FullName"],
      phoneNo: data["Phone"],
      vehicles: vehicles,
    );
  }
}
