import 'package:flutter/material.dart';

import '../../gen/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: ColorName.colorDivider, thickness: 0.4, height: 0.4);
  }
}
