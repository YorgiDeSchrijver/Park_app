import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/my_button.dart';
import 'package:project/components/my_textfield.dart';
import 'package:project/components/square_tile.dart';
import 'package:project/services/auth_service.dart';

import '../components/google_button.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();

  bool ValidEmail = true;
  bool passwordsMatch = true;

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // sign user up method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (!isValidEmail(emailController.text)) {
      Navigator.pop(context);
      setState(() {
        ValidEmail = false;
      });
      return;
    } else {
      setState(() {
        ValidEmail = true;
      });
    }

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        setState(() {
          passwordsMatch = true;
        });
      } else {
        Navigator.pop(context);
        setState(() {
          passwordsMatch = false;
        });
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // logo
                const SizedBox(height: 25),

                // logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Image.asset(
                    'lib/images/LoginAndSignUpImage.png',
                    height: 150,
                  ),
                ),

                const SizedBox(height: 25),

                // welcome back, you've been missed!
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Get on Board!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // welcome back, you've been missed!
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Let\'s create an account for you!',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Email textfield
                MyTextField(
                  controller: fullNameController,
                  hintText: 'Full name',
                  obscureText: false,
                  icon: const Icon(Icons.person_outline),
                  isPassword: false,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: emailController,
                  hintText: 'E-mail',
                  obscureText: false,
                  icon: const Icon(Icons.mail_outline),
                  isPassword: false,
                ),

                Column(
                  children: [
                    if (!ValidEmail)
                      Column(
                        children: const [
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              'Email or password is incorrect. Please try again.',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    // other widgets go here
                  ],
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: const Icon(Icons.fingerprint),
                  isPassword: true,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                  icon: const Icon(Icons.fingerprint),
                  isPassword: true,
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: "Sign up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // google + apple sign in buttons
                GoogleButton(
                  onTap: () => AuthService().signInWithGoogle(),
                  text: "Sign-Up with Google",
                ),

                const SizedBox(height: 25),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
