import '../models/customer_order.dart';

class CustomerService {
  CustomerService._();

  static final CustomerService instance = CustomerService._();

  int gold = 0;
  int combo = 0;

  String serve(CustomerOrder order, String brewedPotion) {
    if (order.isExpired) {
      combo = 0;
      return "Customer left angry 😡 Combo reset!";
    }

    if (order.served) {
      return "Already served";
    }

    if (order.potionName == brewedPotion) {
      order.serve(brewedPotion);

      combo++;

      final bonus = _comboBonus();
      gold += bonus;

      return "Perfect serve! +$bonus gold 🪙 (Combo x$combo)";
    }

    combo = 0;
    return "Wrong potion 😬 Combo reset!";
  }

  int _comboBonus() {
    if (combo >= 10) return 50;
    if (combo >= 5) return 25;
    if (combo >= 3) return 15;
    return 10;
  }
}