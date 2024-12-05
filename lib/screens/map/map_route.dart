import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/map/map_binding.dart';
import 'package:tiktok_clone/screens/map/map_page.dart';

class MapRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      binding: MapBinding(),
      page: () => MapPage(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}