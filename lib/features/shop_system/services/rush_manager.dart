import 'dart:async';

import 'customer_timer_service.dart';
import '../models/customer_order.dart';

class RushManager {
  RushManager._();

  static final RushManager instance = RushManager._();

  int _wave = 0;
  bool _panicMode = false;

  Timer? _timer;

  final List<CustomerOrder> _activeCustomers = [];

  List<CustomerOrder> get customers => _activeCustomers;
  int get wave => _wave;
  bool get isPanic => _panicMode;

  void start(void Function() onUpdate) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _wave++;

      _spawnWave();
      _increasePressure();

      onUpdate();
    });
  }

  void stop() {
    _timer?.cancel();
  }

  void register(CustomerOrder customer) {
    _activeCustomers.add(customer);
    CustomerTimerService.instance.register(customer);
  }

  void _spawnWave() {
    final count = _wave < 3
        ? 1
        : _wave < 6
        ? 2
        : 3;

    for (int i = 0; i < count; i++) {
      final customer = CustomerOrder(
        id: 'rush_${_wave}_$i',
        potionName: _randomPotion(),
        patience: _basePatience(),
      );

      register(customer);
    }
  }

  void _increasePressure() {
    if (_wave % 4 == 0) {
      _triggerPanic();
    }
  }

  void _triggerPanic() {
    _panicMode = true;

    // 🔥 instant burst spawn
    for (int i = 0; i < 3; i++) {
      final customer = CustomerOrder(
        id: 'panic_${_wave}_$i',
        potionName: _randomPotion(),
        patience: 10,
      );

      register(customer);
    }

    // stop panic after short duration
    Future.delayed(const Duration(seconds: 6), () {
      _panicMode = false;
    });
  }

  String _randomPotion() {
    final potions = [
      'Healing Potion',
      'Speed Potion',
      'Arcane Potion',
      'Defense Potion',
    ];

    potions.shuffle();
    return potions.first;
  }

  int _basePatience() {
    if (_panicMode) return 10;

    if (_wave < 3) return 25;
    if (_wave < 6) return 18;
    return 12;
  }
}