import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/my_profile_option.dart';
import 'package:project/pages/Profile_pages/privacy_policy_page.dart';
import 'package:project/pages/Profile_pages/profile_details_page.dart';
import 'package:project/pages/Profile_pages/support_page.dart';

import 'Profile_pages/wallet_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfileDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => profileDetailsPage()),
    );
  }

  void goToWalletPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => walletPage()),
    );
  }

  void goToVehiclePage() {}

  void goToAddressPage() {}

  void goToSupportPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => supportPage()),);
  }

  void goToPrivacyPolicy() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => privacyPolicyPage()),
    );
  }

  void goToLanguagePage() {}

  void goToFaqPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 224, 232),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              //Account
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Text(
                  "Account",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                ),
              ),

              //Name person and image person
              const SizedBox(height: 25),
              GestureDetector(
                onTap: goToProfileDetailsPage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Samantha Smith',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'My Profile',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 24,
                              offset: Offset(0, 8),
                            )
                          ],
                        ),
                        child: Image.asset(
                          'lib/images/apple.png',
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color.fromARGB(255, 83, 178, 86),
                ),
                child: Column(
                  children: [
                    // Wallet
                    GestureDetector(
                      onTap: goToWalletPage,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Wallet',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Quick Payments',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '\$199.30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade100,
                      ),
                      child: Column(
                        children: [
                          profileOption(
                            onTap: goToVehiclePage,
                            icon: Icon(
                              Icons.directions_car_filled_outlined,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "My Vehicle",
                            subText: "Add Vehicle Information",
                          ),
                          profileOption(
                            onTap: goToAddressPage,
                            icon: Icon(
                              Icons.location_on_outlined,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "Manage Address",
                            subText: "Pre Saved Addresses",
                          ),
                          profileOption(
                            onTap: goToSupportPage,
                            icon: Icon(
                              Icons.mail_outline,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "Support",
                            subText: "Connect us for issues & problems",
                          ),
                          profileOption(
                            onTap: goToPrivacyPolicy,
                            icon: Icon(
                              Icons.privacy_tip_outlined,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "Privacy Policy",
                            subText: "Know Our Privacy Policies",
                          ),
                          profileOption(
                            onTap: goToLanguagePage,
                            icon: Icon(
                              Icons.language_outlined,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "Change Language",
                            subText: "Set your Preffered language",
                          ),
                          profileOption(
                            onTap: goToFaqPage,
                            icon: Icon(
                              Icons.question_answer_outlined,
                              color: Color.fromARGB(255, 66, 181, 70),
                            ),
                            headText: "FAQs",
                            subText: "Get your question answered",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
