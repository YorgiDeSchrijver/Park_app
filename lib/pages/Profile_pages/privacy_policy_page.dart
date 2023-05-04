import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/components/my_profile_option.dart';
import 'package:project/components/my_profile_option_top.dart';

class privacyPolicyPage extends StatefulWidget {
  privacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<privacyPolicyPage> createState() => _privacyPolicyPageState();
}

class _privacyPolicyPageState extends State<privacyPolicyPage> {
  final user = FirebaseAuth.instance.currentUser!;

  void singUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 224, 232),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 25),
              const profileOptionTop(
                headText: "Privacy Policy",
                subText: "How we work",
              ),
              const SizedBox(height: 40.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.grey.shade100,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      Text(
                        'Terms of use',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi cursus egestas venenatis. Praesent vel libero massa. Nam eros elit, dapibus ac fermentum a, mollis non nibh. Vestibulum feugiat tristique justo, vitae mattis elit posuere at. ",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut euismod dui. Nulla lacinia a purus molestie maximus. Curabitur turpis nibh, imperdiet at neque in, mollis pretium mi. Mauris pharetra imperdiet mi, eget vestibulum arcu lacinia vel. Cras iaculis egestas efficitur. Vestibulum rhoncus neque tellus, eget venenatis urna mollis sit amet. Morbi ut venenatis ante. Nam id rhoncus nunc, non efficitur ipsum. Nulla sit amet enim eget dui fringilla luctus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut euismod dui. Nulla lacinia a purus molestie maximus. Curabitur turpis nibh, imperdiet at neque in, mollis pretium mi. Mauris pharetra imperdiet mi, eget vestibulum arcu lacinia vel. Cras iaculis egestas efficitur. Vestibulum rhoncus neque tellus, eget venenatis urna mollis sit amet. Morbi ut venenatis ante. Nam id rhoncus nunc, non efficitur ipsum. Nulla sit amet enim eget dui fringilla luctus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut euismod dui. Nulla lacinia a purus molestie maximus. Curabitur turpis nibh, imperdiet at neque in, mollis pretium mi. Mauris pharetra imperdiet mi, eget vestibulum arcu lacinia vel. Cras iaculis egestas efficitur. Vestibulum rhoncus neque tellus, eget venenatis urna mollis sit amet. Morbi ut venenatis ante. Nam id rhoncus nunc, non efficitur ipsum. Nulla sit amet enim eget dui fringilla luctus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
