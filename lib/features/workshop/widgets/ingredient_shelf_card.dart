import 'dart:async';

import 'package:flutter/material.dart';

import '../models/ingredient_shelf.dart';

class IngredientShelfCard extends StatefulWidget {
  final IngredientShelf shelf;
  final VoidCallback? onCollect;

  const IngredientShelfCard({
    super.key,
    required this.shelf,
    this.onCollect,
  });

  @override
  State<IngredientShelfCard> createState() => _IngredientShelfCardState();
}

class _IngredientShelfCardState extends State<IngredientShelfCard> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _timeText {
    final remaining = widget.shelf.remaining;
    if (remaining == Duration.zero) return "Ready";
    return "${remaining.inSeconds}s";
  }

  @override
  Widget build(BuildContext context) {
    final ready = widget.shelf.isReady;

    return Card(
      color: const Color(0xFF31291E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(
          color: Color(0xFFD4A44A),
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: ready ? widget.onCollect : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.shelf.emoji, style: const TextStyle(fontSize: 48)),
              const SizedBox(height: 10),
              Text(
                widget.shelf.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _timeText,
                style: TextStyle(
                  color: ready ? Colors.greenAccent : Colors.orangeAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: ready ? widget.onCollect : null,
                child: Text(ready ? "Collect" : "Restocking"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
