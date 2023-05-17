import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:project/src/repository/authentication_repository/authentication_repository.dart';
import 'package:project/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void SignUpAuthentication(String email, String password) {
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    SignUpAuthentication(user.email, user.password);
    Get.to(() => const OTPScreen());
  }
}
