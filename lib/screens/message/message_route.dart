import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';
import 'package:tiktok_clone/screens/message/message_page.dart';

import 'message_binding.dart';

class MessageRoute extends AppRouteable {
  @override
  Route createRoute(RouteSettings settings) {
    return GetPageRoute(
      settings: settings,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}