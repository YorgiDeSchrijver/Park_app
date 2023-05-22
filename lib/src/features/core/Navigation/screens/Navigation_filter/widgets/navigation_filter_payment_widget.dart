import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';

class NavigationFilterPaymentWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final controller;

  const NavigationFilterPaymentWidget({
    required this.icon,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool selected = controller.selectedPaymentMethods.contains(title);
      return InkWell(
        onTap: () {
          controller.togglePayment(title);
        },
        child: Card(
          elevation: 0,
          color: selected ? Colors.green : Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: selected ? Colors.white : Colors.black,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: selected ? Colors.white : Colors.black87),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
