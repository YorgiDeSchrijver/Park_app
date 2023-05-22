import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/History/screens/history_screen.dart';
import 'package:project/src/features/core/Navigation/screens/navigation_screen.dart';
import 'package:project/src/features/core/Profile/screens/profile_screen.dart';
import 'package:project/src/features/core/dashboard/controllers/dashboard_controller.dart';
import 'package:project/src/features/core/Navigation/screens/New_Parking_Spot/New_Parking_spot_screen.dart';
import 'package:project/src/features/core/dashboard/screens/widgets/bottom_navigation_menu_widget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final DashboardController dashboardController = Get.put(DashboardController(), permanent: false,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => IndexedStack(
          index: dashboardController.tabIndex.value,
          children: [
            NavigationPage(),
            const NewParkingSpotPage(),
            const HistoryPage(),
            const ProfilePage(),
          ],

        )),
        bottomNavigationBar: BottomNavigationMenu(dashboardController: dashboardController),
        
      );
  }
}