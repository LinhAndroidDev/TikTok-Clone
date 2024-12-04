import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/creative/creative_binding.dart';
import 'package:tiktok_clone/screens/creative/creative_page.dart';

class CreativeRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      binding: CreativeBinding(),
      page: () => CreativePage(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}
