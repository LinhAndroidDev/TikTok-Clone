import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/inbox/inbox_binding.dart';

import 'inbox_page.dart';

class InboxRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      binding: InboxBinding(),
      page: () => const InboxPage(),
      transition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
    );
  }
}