import 'package:flutter/material.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/style/text_style.dart';

class DialogWarningFailCamera extends StatelessWidget {
  const DialogWarningFailCamera({
    super.key,
    required this.onTabConfirm
  });

  final VoidCallback onTabConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: const BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cảnh báo', style: text16bold,),
            const SizedBox(height: 10,),
            Text('Kiểm tra lại kết nối camera', style: textNormalSemibold.copyWith(color: ColorName.black),),
            const SizedBox(height: 10,),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () => onTabConfirm.call(),
                  child: Text('OK', style: textNormalBold,),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}