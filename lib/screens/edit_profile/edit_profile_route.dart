import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';

import 'edit_profile_binding.dart';
import 'edit_profile_page.dart';

class EditProfileRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}