import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/models/parking_spot_model.dart';
import 'package:project/src/repository/navigation_repository/navigation_repository.dart';

class NewParkingSpotController extends GetxController{
  static NewParkingSpotController get instance => Get.find();

  final RxList<String> selectedFacilities = <String>[].obs;
  final RxList<String> selectedPaymentMethods = <String>[].obs;

  final title = TextEditingController();
  final location = TextEditingController();
  final numberOfSpots = TextEditingController();
  final price = TextEditingController();
  final startHour = TextEditingController();
  final endHour = TextEditingController();

  final navigationRepo = Get.put(NavigationRepository());

  Future<void> selectTime(BuildContext context, TextEditingController label) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedTime =
          "${pickedTime.hourOfPeriod}:${pickedTime.minute} ${pickedTime.period.name}";
      label.text = formattedTime;
    }
  }

  void toggleFacility(String facilityType){
    if (selectedFacilities.contains(facilityType)) {
      selectedFacilities.remove(facilityType);
    } else {
      selectedFacilities.add(facilityType);
    }
  }

  void togglePayment(String paymentMethod){
    if (selectedPaymentMethods.contains(paymentMethod)) {
      selectedPaymentMethods.remove(paymentMethod);
    } else {
      selectedPaymentMethods.add(paymentMethod);
    }
  }
  
  void clear(){
    selectedFacilities.clear();
    selectedPaymentMethods.clear();
    title.clear();
    location.clear();
    numberOfSpots.clear();
    price.clear();
    startHour.clear();
    endHour.clear();
  }

  String? validate(String? value, String errorMessage){
    if(value == null || value.isEmpty){
      return errorMessage;
    }
    return null;
  }

  Future<void> createNewParkingSpot(ParkingSpotModel parkingSpot) async {
    await navigationRepo.createNewParkingSpot(parkingSpot);
  }

}
