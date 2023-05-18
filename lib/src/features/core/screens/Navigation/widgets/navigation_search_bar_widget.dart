import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/sizes.dart';
import 'package:project/src/features/core/screens/Navigation_filter/navigation_filter_screen.dart';

class NavigationSearchBarWidget extends StatelessWidget {
  const NavigationSearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultSize - 10),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  child: TextField(
                    onTap: () {},
                      decoration: InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.search_location),
                    hintText: "Search location",
                  )),
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  child: Card(
                    child: IconButton(
                      onPressed: () {Get.to(NavigationFilterPage());},
                      icon: Icon(LineAwesomeIcons.horizontal_sliders),
                    ),
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
