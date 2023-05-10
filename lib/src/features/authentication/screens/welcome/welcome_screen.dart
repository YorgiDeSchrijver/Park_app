import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/Login/login_screen.dart';
import 'package:project/src/features/authentication/screens/Sign%20Up/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(welcomeScreenImage), height: height * 0.6),
            Column(
              children: [
                Text(welcomeTitle, style: Theme.of(context).textTheme.headline3),
                Text(welcomeSubTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {Get.to(() => const LoginScreen());},
                    child: Text(login.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {Get.to(() => const SignUpScreen());},
                    child: Text(signUp.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}