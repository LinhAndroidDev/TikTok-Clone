import 'package:get/get.dart';
import 'package:tiktok_clone/routes/app_route.dart';

class AppNavigate {
  static final AppNavigate instance = AppNavigate._internal();

  factory AppNavigate() {
    return instance;
  }

  AppNavigate._internal();

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
    );
  }

  Future<T?> offAllNamed<T>(String page,
      {dynamic arguments, bool withId = true}) async {
    return await Get.offAllNamed(
      page,
      arguments: arguments,
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
      );
    } else {
      Get.until(
            (route) => (route.settings.name == settingName),
      );
    }
  }
}

extension AppNavigateScreen on AppNavigate {
  Future<T> gotoRootPage<T>() async {
    return await offAllNamed(AppRoute.root.rawValue);
  }

  Future<T> gotoHomePage<T>() async {
    return await offAllNamed(AppRoute.home.rawValue);
  }

  Future<T> gotoDiscoverPage<T>() async {
    return await offAllNamed(AppRoute.discover.rawValue);
  }

  Future<T> gotoCreativePage<T>() async {
    return await offAllNamed(AppRoute.creative.rawValue);
  }

  Future<T> gotoInboxPage<T>() async {
    return await offAllNamed(AppRoute.inbox.rawValue);
  }

  Future<T> gotoProfilePage<T>() async {
    return await offAllNamed(AppRoute.profile.rawValue);
  }
}