import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:project/src/features/core/Navigation/controllers/navigation_controller.dart';
import 'package:project/src/features/core/Navigation/screens/widgets/navigation_map_widget.dart';
import 'package:project/src/features/core/Navigation/screens/widgets/navigation_search_bar_widget.dart';
import 'package:project/src/features/core/Navigation/screens/Navigation_filter/navigation_filter_screen.dart';
import 'package:project/src/features/core/dashboard/controllers/dashboard_controller.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with AutomaticKeepAliveClientMixin<NavigationPage> {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: Icon(Icons.location_on)),
      body: Stack(
        children: [
          NavigationMapWidget(),
          NavigationSearchBarWidget(),
        ],
      ),
    );
  }
  
  
}
