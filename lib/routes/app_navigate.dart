import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';

import '../screens/root/bottom_navigation/bottom_navigation_item.dart';
import '../screens/root/root_controller.dart';

class AppNavigate {
  static final AppNavigate instance = AppNavigate._internal();

  factory AppNavigate() {
    return instance;
  }

  AppNavigate._internal();

  int? get _appId {
    try {
      return Get.find<RootController>().key;
    } catch (_) {
      return null;
    }
  }

  void selectedTab(BottomNavigationItem newTab) {
    Get.find<RootController>().updateTabItem(newTab);
  }

  Future<T?> toNamed<T>(
      String page, {
        dynamic arguments,
        bool preventDuplicates = false,
        bool withId = false,
      }) async {
    return await Get.toNamed(
      page,
      arguments: arguments,
      preventDuplicates: preventDuplicates,
      id: withId ? _appId : null,
    );
  }

  Future<T?> offAllNamed<T>(String page,
      {dynamic arguments, bool withId = true}) async {
    return await Get.offAllNamed(
      page,
      arguments: arguments,
      id: withId ? _appId : null,
    );
  }

  void back<T>({
    T? result,
    String? settingName,
    bool withId = true,
  }) {
    if (settingName == null) {
      Get.back(
        result: result,
        id: withId ? _appId : null,
      );
    } else {
      Get.until(
          (route) => (route.settings.name == settingName),
          id: withId ? _appId : null,
      );
    }
  }
}

extension AppNavigateScreen on AppNavigate {
  Future<T> gotoRootPage<T>() async {
    return await offAllNamed(AppRoute.root.rawValue);
  }

  Future<T> gotoHomePage<T>() async {
    selectedTab(BottomNavigationItem.home);
    return await offAllNamed(AppRoute.home.rawValue);
  }

  Future<T?> gotoDiscoverPage<T>() async {
    print('Tiktok Clone: gotoDiscoverPage');
    selectedTab(BottomNavigationItem.discover);
    try {
      return await offAllNamed(AppRoute.discover.rawValue);
    } catch (e) {
      print('Tiktok Clone: $e');
    }
  }

  Future<T> gotoCreativePage<T>() async {
    selectedTab(BottomNavigationItem.creative);
    return await offAllNamed(AppRoute.creative.rawValue);
  }

  Future<T> gotoInboxPage<T>() async {
    selectedTab(BottomNavigationItem.inbox);
    return await offAllNamed(AppRoute.inbox.rawValue);
  }

  Future<T> gotoProfilePage<T>() async {
    selectedTab(BottomNavigationItem.profile);
    return await offAllNamed(AppRoute.profile.rawValue);
  }
}