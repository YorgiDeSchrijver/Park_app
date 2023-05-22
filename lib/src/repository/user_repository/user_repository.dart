import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';
import 'package:project/src/repository/authentication_repository/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final _authRepo = Get.put(AuthenticationRepository());

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Succes",
            "Your account has been created.",
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

  Future<void> addVehicle(VehicleModel vehicle) async {
    final email = _authRepo.firebaseUser.value?.email;
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    List<dynamic> vehicles = userData.vehicles?.map((v) => v.toJson()).toList() ?? [];
    vehicles.add(vehicle.toJson());

    _db
        .collection("Users")
        .doc(userData.id)
        .update({
          "Vehicles": vehicles,
        })
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "Your vehicle has been added.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, StackTrace) {
          Get.snackbar(
            "Error",
            "Something went wrong. Try again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
        });
  }

  Future<List<VehicleModel>> getUserVehicles() async {
    final email = _authRepo.firebaseUser.value?.email;
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    final vehicles = userData.vehicles;
    if (vehicles != null && vehicles.isNotEmpty) {
      return vehicles;
    } else {
      return [];
    }
  }

  Future<UserModel> getUserDetailsOnEmail(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<UserModel> getUserDetailsOnPhoneNo(String phoneNo) async {
    final snapshot =
        await _db.collection("Users").where("Phone", isEqualTo: phoneNo).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<LocationData?> currentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = new Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }
}
