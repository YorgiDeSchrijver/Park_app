import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/src/features/core/controllers/navigation_controller.dart';
import 'package:project/src/features/core/screens/Navigation/widgets/navigation_map_widget.dart';
import 'package:project/src/features/core/screens/Navigation/widgets/navigation_search_bar_widget.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.location_on)),
      body: Stack(
        children: [
          NavigationMapWidget(),
          NavigationSearchBarWidget(),
        ],
      ),
    );
  }
}

