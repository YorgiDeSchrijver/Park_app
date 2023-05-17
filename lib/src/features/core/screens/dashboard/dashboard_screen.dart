import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/controllers/dashboard_controller.dart';
import 'package:project/src/features/core/screens/History/history_screen.dart';
import 'package:project/src/features/core/screens/Navigation/navigation_screen.dart';
import 'package:project/src/features/core/screens/Profile/profile_screen.dart';
import 'package:project/src/features/core/screens/dashboard/widgets/bottom_navigation_menu_widget.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.put(DashboardController(), permanent: false,);
    return Scaffold(
        body: Obx(() => IndexedStack(
          index: dashboardController.tabIndex.value,
          children: [
            NavigationPage(),
            const HistoryPage(),
            const ProfilePage(),
          ],
        )),
        bottomNavigationBar: BottomNavigationMenu(dashboardController: dashboardController),
      );
  }
}