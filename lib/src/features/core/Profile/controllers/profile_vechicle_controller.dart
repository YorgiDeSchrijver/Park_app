import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';

class ProfileVehicleController extends GetxController {
  static ProfileVehicleController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

  String selectedVehicleType = VehicleModel.vehicleTypes[0];

  final vehicleName = TextEditingController();
  final vehicleRegNumber = TextEditingController();

  RxList<VehicleModel> userVehicles = RxList<VehicleModel>([]);

  late Rxn<VehicleModel> selectedVehicle = Rxn<VehicleModel>();

  @override
  void onInit(){
    super.onInit();
    fetchUserVehicles();
  }


  String? validate(String? value, String errorMessage){
    if(value == null || value.isEmpty){
      return errorMessage;
    }
    return null;
  }

  void selectVehicleType(String value){
    selectedVehicleType = value;
  }

  Future<void> addVehicle(VehicleModel vehicle) async{
    await _userRepo.addVehicle(vehicle);
    userVehicles.add(vehicle);
    selectedVehicle.value = vehicle;
  }

  Future<void> fetchUserVehicles() async {
    final vehicles = await _userRepo.getUserVehicles();
    userVehicles.assignAll(vehicles);
    if(vehicles.isNotEmpty){
      selectedVehicle.value = vehicles[0];
    }
  }

  void clear(){
    selectedVehicleType = VehicleModel.vehicleTypes[0];
    vehicleName.clear();
    vehicleRegNumber.clear();
  }

  void onVehicleSelected(VehicleModel vehicle) {
    selectedVehicle.value = vehicle;
  }
}