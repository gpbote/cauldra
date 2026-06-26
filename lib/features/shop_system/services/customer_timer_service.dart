import 'dart:async';

import '../models/customer_order.dart';

class CustomerTimerService {
  CustomerTimerService._();

  static final CustomerTimerService instance =
  CustomerTimerService._();

  Timer? _timer;

  final List<CustomerOrder> _customers = [];

  List<CustomerOrder> get customers => _customers;

  void register(CustomerOrder customer) {
    _customers.add(customer);
  }

  void start(void Function() onUpdate) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      for (final c in _customers) {
        c.tick();
      }

      onUpdate();
    });
  }

  void stop() {
    _timer?.cancel();
  }
}