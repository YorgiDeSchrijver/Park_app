import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/features/core/controllers/navigation_controller.dart';

class NavigationFilterPage extends StatelessWidget {
  const NavigationFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text("Filter", style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          GestureDetector(
            onTap: () {
              // Perform the reset action here
              // e.g., reset the filters or form fields
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                "Reset",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}