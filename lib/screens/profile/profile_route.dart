import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/profile/profile_page.dart';

import 'profile_binding.dart';

class ProfileRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      binding: ProfileBinding(),
      page: () => ProfilePage(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}