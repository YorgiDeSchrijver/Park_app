import 'package:flutter/material.dart';
import 'package:project/src/features/core/controllers/navigation_controller.dart';
import 'package:project/src/features/core/screens/Navigation_filter/widgets/navigation_filter_payment_widget.dart';

class PaymentTypesWidget extends StatelessWidget {
  const PaymentTypesWidget({
    super.key,
    required this.controller,
  });

  final controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 2.7,
      children: [
        NavigationFilterPaymentWidget(
          icon: Icons.account_balance_wallet,
          title: "Wallet",
          controller: controller,
        ),
        NavigationFilterPaymentWidget(
          icon: Icons.attach_money,
          title: "Pay on Spot",
          controller: controller,
        ),
        NavigationFilterPaymentWidget(
          icon: Icons.credit_card,
          title: "Credit Card",
          controller: controller,
        ),
        NavigationFilterPaymentWidget(
          icon: Icons.payment,
          title: "Paypal",
          controller: controller,
        ),
      ],
    );
  }
}