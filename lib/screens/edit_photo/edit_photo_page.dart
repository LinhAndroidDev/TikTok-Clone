import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/gen/colors.dart';
import 'package:tiktok_clone/screens/edit_photo/edit_photo_controller.dart';
import 'package:tiktok_clone/style/text_style.dart';

class EditPhotoPage extends StatelessWidget {
  EditPhotoPage({super.key});

  final controller = Get.find<EditPhotoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Photo'),
        titleTextStyle: text16bold.copyWith(color: ColorName.black),
        backgroundColor: ColorName.greyWhite,
        surfaceTintColor: ColorName.greyWhite,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.keyboard_backspace, size: 25, color: ColorName.blue,)),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Obx(() => RepaintBoundary(
                  key: controller.repaintBoundaryKey,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                      color: ColorName.greyDark,
                      child: GestureDetector(
                          onTapDown: (details) {
                            controller.dragItems.add(details.localPosition);
                          },
                          onPanUpdate: (details) {
                            controller.points.add(details.localPosition);
                          },
                          onPanEnd: (details) {
                            controller.points.add(Offset.zero);
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Image.file(File(controller.photoPath.value), fit: BoxFit.fill,)),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: CustomPaint(
                                  painter: DrawingPainter(
                                      points: controller.points.value),
                                ),
                              ),
                              // _buildListDragMe()
                              // Positioned(
                              //   left: controller.x.value,
                              //   top: controller.y.value,
                              //   child: GestureDetector(
                              //     onPanUpdate: (details) {
                              //       // Cập nhật vị trí khi kéo
                              //       controller.x.value += details.delta.dx;
                              //       controller.y.value += details.delta.dy;
                              //     },
                              //     child: Container(
                              //       width: 100,
                              //       height: 100,
                              //       color: Colors.blue,
                              //       child: const Center(
                              //         child: Text(
                              //           'Drag Me',
                              //           style: TextStyle(color: Colors.white, fontSize: 12),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ))),
                ))),
            const SizedBox(height: 50,),
            _buildViewController(context),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }

  Widget _buildListDragMe() {
    return Stack(
      children: [
        ...controller.dragItems.asMap().entries.map((entry) {
          int index = entry.key;
          Offset position = entry.value;
          return Positioned(child: Positioned(
            left: position.dx - 50,
            top: position.dy - 50,
            child: GestureDetector(
              onPanUpdate: (details) {
                // Cập nhật vị trí khi kéo
                controller.dragItems[index] += Offset(details.delta.dx, details.delta.dy);
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Drag Me',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ));
        })
      ],
    );
  }

  Widget _buildViewController(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black, width: 1)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.edit, size: 25,),
          const SizedBox(width: 5,),
          const Icon(Icons.circle_outlined, size: 25,),
          const SizedBox(width: 5,),
          const Icon(Icons.square_outlined, size: 25,),
          const SizedBox(width: 5,),
          Transform.rotate(
              angle: - 3.1415926535897932 * 3 /4,
              child: const Icon(Icons.arrow_right_alt, size: 25,)),
          const SizedBox(width: 5,),
          InkWell(
            onTap: () => controller.saveDrawingToGallery(context),
              child: const Icon(Icons.save, size: 25,))
        ],
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset> points;

  DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
