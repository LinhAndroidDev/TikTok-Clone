import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_route.dart';
import 'bottom_navigation/bottom_navigation.dart';
import 'root_controller.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final controller = Get.find<RootController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: _buildStackNavigator(),
      bottomNavigationBar: Obx(
        () => BottomNavigation(
          currentTab: controller.tab.value,
          onSelectTab: controller.selectTab,
        ),
      ),
    );
  }

  Widget _buildStackNavigator() {
    return Navigator(
      key: Get.nestedKey(controller.key),
      observers: [GetObserver((_) async {}, Get.routing)],
      initialRoute: AppRoute.home.rawValue,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
