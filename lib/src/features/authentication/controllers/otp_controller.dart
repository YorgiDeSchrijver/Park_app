import 'package:get/get.dart';
import 'package:project/src/features/core/dashboard/screens/dashboard_screen.dart';
import 'package:project/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified? Get.offAll(Dashboard()) : Get.back();
  }
}