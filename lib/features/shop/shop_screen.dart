import 'package:flutter/material.dart';

import '../../shared/widgets/screen_shake.dart';

import '../shop_system/widgets/customer_widget.dart';
import '../shop_system/models/customer_order.dart';

import '../shop_system/widgets/brewing_station_widget.dart';

import '../shop_system/models/ingredient_shelf.dart';
import '../shop_system/widgets/ingredient_shelf_widget.dart';

import '../../core/data/item_database.dart';

import '../shop_system/services/customer_service.dart';
import '../shop_system/services/customer_timer_service.dart';
import '../shop_system/services/brewing_result_store.dart';
import '../shop_system/services/rush_manager.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late List<CustomerOrder> customers;
  late List<IngredientShelf> shelves;

  @override
  void initState() {
    super.initState();

    customers = [];

    shelves = [
      IngredientShelf(
        id: 'lavender',
        name: 'Lavender Shelf',
        item: ItemDatabase.herb,
        maxStock: 5,
        refillTime: const Duration(seconds: 10),
        currentStock: 5,
      ),
      IngredientShelf(
        id: 'mushroom',
        name: 'Mushroom Shelf',
        item: ItemDatabase.mushroom,
        maxStock: 5,
        refillTime: const Duration(seconds: 10),
        currentStock: 5,
      ),
      IngredientShelf(
        id: 'bottle',
        name: 'Bottle Shelf',
        item: ItemDatabase.bottle,
        maxStock: 5,
        refillTime: const Duration(seconds: 10),
        currentStock: 5,
      ),
    ];

    // ⚡ START RUSH MODE
    RushManager.instance.start(() {
      setState(() {
        customers = RushManager.instance.customers;
      });
    });
  }

  // 🎯 TARGET CUSTOMER (auto-highlight system)
  CustomerOrder? get _targetCustomer {
    final potion = BrewingResultStore.lastPotion;

    if (potion == null) return null;

    for (final c in customers) {
      if (!c.isExpired && !c.served && c.potionName == potion) {
        return c;
      }
    }

    return null;
  }

  void _serve() {
    final potion = BrewingResultStore.lastPotion;
    if (potion == null) return;

    for (final customer in customers) {
      if (!customer.isExpired && !customer.served) {
        final result =
        CustomerService.instance.serve(customer, potion);

        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result)),
        );

        break;
      }
    }
  }

  @override
  void dispose() {
    RushManager.instance.stop();
    CustomerTimerService.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final combo = CustomerService.instance.combo;
    final isPanic = RushManager.instance.isPanic;

    return ScreenShake(
      intensity: combo >= 5 ? 10 : 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1A17),
        appBar: AppBar(
          title: const Text('Cauldra Rush Mode'),
          backgroundColor: const Color(0xFF31291E),
          foregroundColor: const Color(0xFFF7F1E3),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),

            // 🔥 PANIC MODE BANNER
            if (isPanic)
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "🔥 PANIC MODE ACTIVE 🔥",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // 🧍 CUSTOMER QUEUE
            SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: customers.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
                itemBuilder: (context, i) {
                  final c = customers[i];
                  final target = _targetCustomer;

                  return Opacity(
                    opacity: c.isExpired ? 0.3 : 1,
                    child: CustomerWidget(
                      order: c,
                      isTarget: target == c,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            const BrewingStationWidget(),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: _serve,
              child: const Text("Serve Customer 🍷"),
            ),

            const SizedBox(height: 10),

            // 🌿 SHELVES
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: shelves.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return IngredientShelfWidget(
                    shelf: shelves[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // 💰 GOLD (ANIMATED)
            TweenAnimationBuilder(
              tween: IntTween(
                begin: 0,
                end: CustomerService.instance.gold,
              ),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, _) {
                return Text(
                  "💰 Gold: $value",
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 5),

            // 🔥 COMBO DISPLAY
            Text(
              combo >= 5
                  ? "🔥 COMBO x$combo (HOT!)"
                  : "🔥 Combo: $combo",
              style: TextStyle(
                color: combo >= 5
                    ? Colors.redAccent
                    : Colors.orange,
                fontSize: combo >= 5 ? 22 : 16,
                fontWeight: FontWeight.bold,
                shadows: combo >= 5
                    ? [
                  const Shadow(
                    blurRadius: 10,
                    color: Colors.red,
                  )
                ]
                    : [],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}