import 'package:flutter/material.dart';

import '../../core/services/customer_service.dart';
import '../../core/services/sell_service.dart';
import '../../core/managers/game_manager.dart';
import '../../core/models/customer_request.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  static const Color backgroundColor = Color(0xFF1B1A17);
  static const Color panelColor = Color(0xFF31291E);
  static const Color accentColor = Color(0xFFD4A44A);
  static const Color textColor = Color(0xFFF7F1E3);

  late List<CustomerRequest> _customers;

  @override
  void initState() {
    super.initState();
    _customers = CustomerService.instance.getQueue();
  }

  void _sell(CustomerRequest request) {
    final player = GameManager.instance.player;
    if (player == null) return;

    SellService.instance.sell(request: request);

    CustomerService.instance.completeOrder(request);

    setState(() {
      _customers = CustomerService.instance.getQueue();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Sold to ${request.name}! +${request.rewardGold}g',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Customers"),
        centerTitle: true,
        backgroundColor: panelColor,
        foregroundColor: textColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _customers.length,
          itemBuilder: (context, index) {
            final c = _customers[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: panelColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accentColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.name,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Wants: ${c.requestedPotion}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Reward: ${c.rewardGold}g | +${c.rewardReputation} rep",
                    style: const TextStyle(color: accentColor),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _sell(c),
                      child: const Text("Sell Potion"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}