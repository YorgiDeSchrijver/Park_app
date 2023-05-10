import 'package:flutter/material.dart';
import 'package:project/src/old%20pages/login_page.dart';


class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  void navigateToSignUpPage() {
    setState(() {
      showLoginPage = false;
    });
  }

  Widget _buildPage(Widget child) {
    return Container(
      key: UniqueKey(),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      child: showLoginPage
          ? _buildPage(
              LoginPage(
                key: UniqueKey(),
                onTap: togglePages,
              ),
            )
          : _buildPage(
              LoginPage(
                key: UniqueKey(),
                onTap: togglePages,
              ),
            ),
    );
  }
}
