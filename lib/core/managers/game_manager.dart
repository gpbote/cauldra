import '../models/player_profile.dart';
import '../services/save_service.dart';

class GameManager {
  GameManager._();

  static final GameManager instance = GameManager._();

  final SaveService _saveService = SaveService();

  PlayerProfile? _player;

  PlayerProfile? get player => _player;

  bool get hasPlayer => _player != null;

  Future<void> loadGame() async {
    _player = await _saveService.loadPlayer();
  }

  Future<void> newGame({
    required String name,
    required String gender,
  }) async {
    _player = await _saveService.createNewPlayer(
      name: name,
      gender: gender,
    );
  }

  Future<void> saveGame() async {
    if (_player == null) return;
    await _saveService.savePlayer(_player!);
  }

  Future<void> deleteGame() async {
    await _saveService.deleteSave();
    _player = null;
  }

  /// 🔥 TRUE STATE UPDATE (IMPORTANT FIX)
  void updatePlayer(PlayerProfile updated) {
    _player = updated;
    _saveService.savePlayer(updated);
  }

  /// 🔥 ADD GOLD (used for brewing later)
  void addGold(int amount) {
    if (_player == null) return;

    _player = _player!.copyWith(
      gold: _player!.gold + amount,
    );

    saveGame();
  }

  /// 🔥 ADD REPUTATION (brewing progression)
  void addReputation(int amount) {
    if (_player == null) return;

    _player = _player!.copyWith(
      reputation: _player!.reputation + amount,
    );

    saveGame();
  }
}