class CustomerRequest {
  final String id;
  final String name;
  final String requestedPotion;
  final int rewardGold;
  final int rewardReputation;

  const CustomerRequest({
    required this.id,
    required this.name,
    required this.requestedPotion,
    required this.rewardGold,
    required this.rewardReputation,
  });
}