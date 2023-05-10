import 'package:flutter/material.dart';
import 'package:project/src/common_widgets/form/form_header_widget.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/Sign%20Up/widgets/signup_footer_widget.dart';
import 'package:project/src/features/authentication/screens/Sign%20Up/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: welcomeScreenImage,
                  title: signUpTitle,
                  subTitle: signUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}