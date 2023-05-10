import 'package:flutter/material.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            icon: const Image(
                image: AssetImage(googleLogoImage),
                width: 20.0,
                fit: BoxFit.contain),
            onPressed: () {},
            label: const Text(signInWithGoogle),
          ),
        ),
        const SizedBox(height: formHeight - 20),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: dontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(text: signUp.toUpperCase(), style: TextStyle(color: Colors.blue))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
