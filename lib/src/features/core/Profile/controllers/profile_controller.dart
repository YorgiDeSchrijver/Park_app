import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/Profile/models/vehicle_model.dart';
import 'package:project/src/repository/authentication_repository/authentication_repository.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  String selectedVehicleType = VehicleModel.vehicleTypes[0];

  final vehicleName = TextEditingController();
  final vehicleRegNumber = TextEditingController();

  

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    final phoneNo = _authRepo.firebaseUser.value?.phoneNumber;
    if(email != null && email != ""){
        return _userRepo.getUserDetailsOnEmail(email);
    } else if (phoneNo != null && phoneNo != ""){
      return _userRepo.getUserDetailsOnPhoneNo(phoneNo);
    } else{
      Get.snackbar("Error", "Login to continue");
    }
  }

  updateUserRecord(UserModel user) async{
    await _userRepo.updateUserRecord(user);
  }

  logout(){
    _authRepo.logout();
  }


}