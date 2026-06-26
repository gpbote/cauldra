import '../managers/game_manager.dart';
import '../models/customer_request.dart';

class SellService {
  SellService._();

  static final SellService instance = SellService._();

  bool canSell({
    required String potionName,
    required CustomerRequest request,
  }) {
    return potionName == request.requestedPotion;
  }

  void sell({
    required CustomerRequest request,
  }) {
    final player = GameManager.instance.player;
    if (player == null) return;

    final updated = player.copyWith(
      gold: player.gold + request.rewardGold,
      reputation: player.reputation + request.rewardReputation,
    );

    GameManager.instance.updatePlayer(updated);
  }
}