import 'package:flutter/material.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail_screen.dart';
import 'package:project/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineLarge),
            Text(forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: email,
              subTitle: resetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {},
              title: phoneNo,
              subTitle: resetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}