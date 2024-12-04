import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/discover/discover_binding.dart';

import 'discover_page.dart';

class DiscoverRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      binding: DiscoverBinding(),
      page: () => const DiscoverPage(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}
