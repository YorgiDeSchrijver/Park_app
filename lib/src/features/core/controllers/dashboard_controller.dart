import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/screens/History/history_screen.dart';
import 'package:project/src/features/core/screens/Navigation/navigation_screen.dart';
import 'package:project/src/features/core/screens/Profile/profile_screen.dart';
import 'package:project/src/repository/authentication_repository/authentication_repository.dart';

class DashboardController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index){
    tabIndex.value = index;
  }
}