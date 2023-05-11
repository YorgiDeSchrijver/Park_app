import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/colors.dart';
import 'package:project/src/constants/image_strings.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/constants/text_strings.dart';
import 'package:project/src/features/core/controllers/profile_controller.dart';
import 'package:project/src/features/core/screens/Profile/update_profile_screen.dart';
import 'package:project/src/features/core/screens/Profile/widgets/profile_menu_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(

        title: Text(profile, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center, ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
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
                          child: Icon(LineAwesomeIcons.alternate_pencil,
                              size: 20.0, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                profileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                profileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  child: const Text(
                    editProfile,
                    style: TextStyle(color: blackColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              //Menu
              ProfileMenuWidget(
                  title: menu1, icon: LineAwesomeIcons.cog, onPress: () {}),
              ProfileMenuWidget(
                  title: menu2, icon: LineAwesomeIcons.wallet, onPress: () {}),
              ProfileMenuWidget(
                  title: menu3,
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                  title: menu4, icon: LineAwesomeIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: menu5,
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {controller.logout();}),
            ],
          ),
        ),
      ),
    );
  }
}
