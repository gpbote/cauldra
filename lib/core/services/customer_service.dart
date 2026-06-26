import '../models/customer_request.dart';

class CustomerService {
  CustomerService._();

  static final CustomerService instance = CustomerService._();

  final List<CustomerRequest> _queue = [
    const CustomerRequest(
      id: 'c1',
      name: 'Village Guard',
      requestedPotion: 'Minor Healing Potion',
      rewardGold: 25,
      rewardReputation: 5,
    ),
    const CustomerRequest(
      id: 'c2',
      name: 'Wounded Traveler',
      requestedPotion: 'Energy Potion',
      rewardGold: 35,
      rewardReputation: 8,
    ),
  ];

  List<CustomerRequest> getQueue() => List.unmodifiable(_queue);

  CustomerRequest getNext() {
    return _queue.first;
  }

  void completeOrder(CustomerRequest request) {
    _queue.removeWhere((c) => c.id == request.id);
  }
}