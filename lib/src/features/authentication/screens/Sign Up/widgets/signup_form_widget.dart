import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/controllers/signup_controller.dart';
import 'package:project/src/features/authentication/models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(fullName),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(email),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(phoneNo),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: formHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(password),
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            const SizedBox(height: formHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    //SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                    );

                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(signUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
