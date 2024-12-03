import 'package:flutter/material.dart';

class FixedWidthIndicator extends Decoration {
  final Color color;
  final double width;
  final double thickness;

  const FixedWidthIndicator({
    required this.color,
    required this.width,
    required this.thickness,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _FixedWidthIndicatorPainter(
      color: color,
      width: width,
      thickness: thickness,
    );
  }
}

class _FixedWidthIndicatorPainter extends BoxPainter {
  final Color color;
  final double width;
  final double thickness;

  _FixedWidthIndicatorPainter({
    required this.color,
    required this.width,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double startX = offset.dx + (configuration.size!.width - width) / 2;
    final double endX = startX + width;
    final double y = configuration.size!.height - thickness;

    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = thickness
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
  }
}