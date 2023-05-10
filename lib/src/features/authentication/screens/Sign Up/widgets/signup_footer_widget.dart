import 'package:flutter/material.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/Login/login_screen.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'OR',
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: formHeight - 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(googleLogoImage),
              width: 20.0,
            ),
            label: Text(signInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {Get.to(() => const LoginScreen());},
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: alreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: login.toUpperCase())
          ])),
        )
      ],
    );
  }
}