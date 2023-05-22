import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/dashboard/controllers/dashboard_controller.dart';

class BottomNavigationMenu extends StatelessWidget {
  final DashboardController dashboardController;

  const BottomNavigationMenu({
    super.key,
    required this.dashboardController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: dashboardController.changeTabIndex,
          currentIndex: dashboardController.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_parking),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_location_alt_outlined),
              label: 'Add Spot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
