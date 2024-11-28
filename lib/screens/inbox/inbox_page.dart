import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/style/text_style.dart';

import '../../gen/assets.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorName.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 60,),
            _buildHeader(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icInboxThin.svg(width: 70, height: 70),
                  const SizedBox(height: 20),
                  Text('Notifications aren’t available', style: text16Semibold.copyWith(color: Colors.black)),
                  const SizedBox(height: 10),
                  Text('Notifications about your account will appear here', style: textSmall.copyWith(color: Colors.grey)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      fit: StackFit.loose,
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('All activity', style: text16bold,),
              const SizedBox(width: 4,),
              Assets.images.icTriangle.svg(width: 7, height: 7)
            ],
          ),
        ),
        Positioned(
          right: 15,
            child: Assets.images.icSend.svg(width: 20, height: 20))
      ],
    );
  }
}
