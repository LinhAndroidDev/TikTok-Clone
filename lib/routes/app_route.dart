import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/screens/creative/creative_route.dart';
import 'package:tiktok_clone/screens/discover/discover_route.dart';
import 'package:tiktok_clone/screens/home/home_route.dart';
import 'package:tiktok_clone/screens/inbox/inbox_route.dart';
import 'package:tiktok_clone/screens/profile/profile_route.dart';
import 'package:tiktok_clone/screens/root/root_route.dart';

abstract class AppRouteable<T> {
  Route createRoute(RouteSettings settings) {
    throw UnimplementedError();
  }
}

enum AppRoute {
  root('/root'),
  home('/home'),
  discover('/discover'),
  creative('/creative'),
  inbox('/inbox'),
  profile('/profile');

  const AppRoute(this.rawValue);

  final String rawValue;

  static AppRoute? getScreenNameByString(String routing) => AppRoute.values
      .firstWhereOrNull((activity) => activity.rawValue == routing);

  static Route? onGenerateRoute(RouteSettings settings) {
    final name = AppRoute.getScreenNameByString(settings.name ?? '');
    if (name == null) {
      return null;
    }
    switch (name) {
      case AppRoute.root:
        return RootRoute().createRoute(settings);
      case AppRoute.home:
        return HomeRoute().createRoute(settings);
      case AppRoute.discover:
        return DiscoverRoute().createRoute(settings);
      case AppRoute.creative:
        return CreativeRoute().createRoute(settings);
      case AppRoute.inbox:
        return InboxRoute().createRoute(settings);
      case AppRoute.profile:
        return ProfileRoute().createRoute(settings);
    }
  }

  static Duration getDuration(Transition transition) {
    if (transition == Transition.noTransition) {
      return const Duration(milliseconds: 0);
    } else {
      return const Duration(milliseconds: 300);
    }
  }
}