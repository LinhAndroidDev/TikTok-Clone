import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_navigate.dart';
import 'bottom_navigation/bottom_navigation_item.dart';

class RootController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final tab = BottomNavigationItem.home.obs;
  final key = 0;

  bool get canPop {
    return Get.nestedKey(key)?.currentState?.canPop() ?? false;
  }

  void updateTabItem(BottomNavigationItem newTab) => (tab.value = newTab);

  void selectTab(BottomNavigationItem newTab) async {
    if (newTab == tab.value) {
      if (!canPop) {
      } else {
        Get.until((route) => route.isFirst, id: key);
      }
    } else {
      switch (newTab) {
        case BottomNavigationItem.home:
          AppNavigate.instance.gotoHomePage();
          break;
        case BottomNavigationItem.discover:
          AppNavigate.instance.gotoDiscoverPage();
          break;
        case BottomNavigationItem.creative:
          AppNavigate.instance.gotoCreativePage();
          break;
        case BottomNavigationItem.inbox:
          AppNavigate.instance.gotoInboxPage();
          break;
        case BottomNavigationItem.profile:
          AppNavigate.instance.gotoProfilePage();
          break;
      }
    }
  }
}
