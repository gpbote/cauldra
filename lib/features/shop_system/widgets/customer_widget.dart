import 'package:flutter/material.dart';
import '../models/customer_order.dart';

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
      width: 120,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2B241C),
        borderRadius: BorderRadius.circular(12),

        // 🎯 TARGET HIGHLIGHT
        border: Border.all(
          color: isTarget ? Colors.yellow : borderColor,
          width: isTarget ? 3 : 2,
        ),

        // 💥 GLOW EFFECT (FIXED — NO withOpacity)
        boxShadow: isTarget
            ? [
          BoxShadow(
            color: Colors.yellow.withValues(alpha: 0.5),
            blurRadius: 12,
            spreadRadius: 2,
          )
        ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 😡 EMOTION ICON
          Text(
            order.emotion == "angry"
                ? "😡"
                : order.emotion == "happy"
                ? "😊"
                : "😐",
            style: const TextStyle(fontSize: 28),
          ),

          const SizedBox(height: 8),

          // 📦 ORDER NAME
          Text(
            order.potionName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          // ⏱ TIMER BAR
          LinearProgressIndicator(
            value: order.remainingTime / order.patience,
            backgroundColor: Colors.black,
            color: borderColor,
          ),
        ],
      ),
    );
  }
}