import 'package:flutter/material.dart';

import '../models/customer_order.dart';
import 'order_icon.dart';

class CustomerWidget extends StatelessWidget {
  final CustomerOrder order;
  final bool isTarget;

  const CustomerWidget({
    super.key,
    required this.order,
    this.isTarget = false,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;

    switch (order.emotion) {
      case "angry":
        borderColor = Colors.red;
        break;
      case "happy":
        borderColor = Colors.green;
        break;
      default:
        borderColor = Colors.grey;
    }

    return Container(
      width: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2B241C),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isTarget ? Colors.yellow : borderColor,
          width: isTarget ? 3 : 2,
        ),
        boxShadow: isTarget
            ? [
          BoxShadow(
            color: Colors.yellow.withValues(alpha: 0.50),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ===========================
          // ORDER BUBBLE
          // ===========================
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 72,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: OrderIcon(
                    type: OrderIconType.healingPotion,
                    size: 42,
                  ),
                ),
              ),

              Positioned(
                bottom: -8,
                child: CustomPaint(
                  size: const Size(18, 10),
                  painter: _BubbleTailPainter(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            order.emotion == "happy"
                ? "😊"
                : order.emotion == "angry"
                ? "😡"
                : "😐",
            style: const TextStyle(fontSize: 30),
          ),

          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: order.remainingTime / order.patience,
              minHeight: 8,
              backgroundColor: Colors.black,
              color: borderColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}