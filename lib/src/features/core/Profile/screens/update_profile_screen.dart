import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/authentication/models/user_model.dart';
import 'package:project/src/features/core/Profile/controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    bool obscureText = true;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title:
            Text(editProfile, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white),
          padding: const EdgeInsets.all(defaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  print(userData.id);
                  final Cemail = TextEditingController(text: userData.email);
                  final Cpassword = TextEditingController(text: userData.password);
                  final CfullName = TextEditingController(text: userData.fullName);
                  final CphoneNo = TextEditingController(text: userData.phoneNo);
                  return Column(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    image: AssetImage(profileImageNotFound),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: primaryColor),
                                  child: Icon(LineAwesomeIcons.camera,
                                      size: 20.0, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: CfullName,
                                  decoration: const InputDecoration(
                                    label: Text(fullName),
                                    prefixIcon: Icon(LineAwesomeIcons.user),
                                  ),
                                ),
                                const SizedBox(height: formHeight - 20),
                                TextFormField(
                                  controller: Cemail,
                                  decoration: const InputDecoration(
                                    label: Text(email),
                                    prefixIcon: Icon(LineAwesomeIcons.envelope),
                                  ),
                                ),
                                const SizedBox(height: formHeight - 20),
                                TextFormField(
                                  controller: CphoneNo,
                                  decoration: const InputDecoration(
                                    label: Text(phoneNo),
                                    prefixIcon: Icon(LineAwesomeIcons.phone),
                                  ),
                                ),
                                const SizedBox(height: formHeight - 20),
                                TextFormField(
                                  controller: Cpassword,
                                  obscureText: obscureText,
                                  decoration: InputDecoration(
                                    label: Text(password),
                                    prefixIcon:
                                        Icon(LineAwesomeIcons.fingerprint),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          !obscureText;
                                        },
                                        icon: Icon(obscureText
                                            ? LineAwesomeIcons.eye_slash
                                            : LineAwesomeIcons.eye)),
                                  ),
                                ),
                                const SizedBox(height: formHeight),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final UserData = UserModel(
                                        id: userData.id,
                                        email: Cemail.text.trim(),
                                        password:
                                            Cpassword.text.trim(),
                                        fullName:
                                            CfullName.text.trim(),
                                        phoneNo: CphoneNo.text.trim(),
                                      );
                                      await controller
                                          .updateUserRecord(UserData);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
                                        side: BorderSide.none,
                                        shape: const StadiumBorder()),
                                    child: const Text(
                                      editProfile,
                                      style: TextStyle(color: blackColor),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: formHeight),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: joined,
                                        style: TextStyle(fontSize: 12),
                                        children: [
                                          TextSpan(
                                            text: joinedAt,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.redAccent.withOpacity(0.1),
                                          elevation: 0,
                                          foregroundColor: Colors.red,
                                          shape: const StadiumBorder(),
                                          side: BorderSide.none),
                                      child: const Text(delete),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
