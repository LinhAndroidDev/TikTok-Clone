import 'package:flutter/material.dart';

import '../../../gen/assets.dart';

enum BottomNavigationItem { home, discover, creative, inbox, profile }

extension BottomNavigationExtension on BottomNavigationItem {
  Widget tabItem(
      {required bool isSelected,
      required double width,
      required bool homeSelected}) {
    switch (this) {
      case BottomNavigationItem.home:
        return (isSelected)
            ? Assets.images.icHomeCheck.svg(width: width, height: width)
            : Assets.images.icHomeUnCheck.svg(width: width, height: width);

      case BottomNavigationItem.discover:
        return (isSelected)
            ? Assets.images.icSearchCheck.svg(width: width, height: width)
            : Assets.images.icSearchUnCheck.svg(width: width, height: width);

      case BottomNavigationItem.creative:
        return (homeSelected)
            ? Assets.images.icCreativeLight.svg(width: 43, height: 28)
            : Assets.images.icCreativeDark.svg(width: 43, height: 28);

      case BottomNavigationItem.inbox:
        return (isSelected)
            ? Assets.images.icInboxCheck.svg(width: width, height: width)
            : Assets.images.icInboxUnCheck.svg(width: width, height: width);

      case BottomNavigationItem.profile:
        return (isSelected)
            ? Assets.images.icAccountCheck.svg(width: width, height: width)
            : Assets.images.icAccountUnCheck.svg(width: width, height: width);
    }
  }

  String get name {
    switch (this) {
      case BottomNavigationItem.home:
        return 'Home';
      case BottomNavigationItem.discover:
        return 'Discover';
      case BottomNavigationItem.creative:
        return '';
      case BottomNavigationItem.inbox:
        return 'Inbox';
      case BottomNavigationItem.profile:
        return 'Profile';
    }
  }
}
