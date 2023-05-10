import 'package:flutter/material.dart';
import 'package:project/src/common_widgets/form/form_header_widget.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/screens/Login/widgets/Login_form_widget.dart';
import 'package:project/src/features/authentication/screens/Login/widgets/login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                FormHeaderWidget(
                  image: welcomeScreenImage,
                  title: loginTitle,
                  subTitle: loginSubTitle,
                  imageHeight: 0.2,
                ),
                LoginForm(),
                LoginFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}