import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/widget/divider/divider.dart';

import '../../gen/assets.dart';
import '../../style/text_style.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

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
            const SizedBox(height: 10,),
            const CustomDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.icSendThin.svg(width: 70, height: 70),
                  const SizedBox(height: 20),
                  Text('Message your friends', style: text16Semibold.copyWith(color: Colors.black)),
                  const SizedBox(height: 10),
                  Text('Share videos or start a conversation', style: textSmall.copyWith(color: Colors.grey)),
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
        Positioned(
          left: 15,
            child: InkWell(
              onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new_sharp, color: ColorName.black, size: 18,))),
        Align(
          alignment: Alignment.center,
          child: Text('Direct messages', style: text16bold,),
        ),
        const Positioned(
            right: 15,
            child: Icon(Icons.add, color: ColorName.black, size: 20,)),
      ],
    );
  }
}
