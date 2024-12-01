import 'package:flutter/material.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../../gen/colors.dart';
import 'bottom_navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});

  final BottomNavigationItem currentTab;
  final ValueChanged<BottomNavigationItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 0.1,
          thickness: 0.1,
          color: ColorName.black,
        ),
        BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: (currentTab == BottomNavigationItem.home)
              ? ColorName.black
              : ColorName.white,
          items: BottomNavigationItem.values.map(_buildItem).toList(),
          selectedItemColor: (currentTab == BottomNavigationItem.home)
              ? ColorName.white
              : ColorName.black,
          // Xóa màu mặc định
          unselectedItemColor: ColorName.greyLight,
          selectedLabelStyle: textSmallBold.copyWith(
              color: (currentTab == BottomNavigationItem.home)
                  ? ColorName.white
                  : ColorName.black),
          unselectedLabelStyle: textSmall.copyWith(color: ColorName.greyLight),
          currentIndex: currentTab.index,
          onTap: (index) => onSelectTab(
            BottomNavigationItem.values[index],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildItem(BottomNavigationItem item) {
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: item.tabItem(
              isSelected: item == currentTab,
              width: 20,
              homeSelected: currentTab == BottomNavigationItem.home),
        ),
        label: item.name);
  }
}
