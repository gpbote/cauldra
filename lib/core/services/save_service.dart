import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/player_profile.dart';

class SaveService {
  static const String _playerKey = 'player_profile';

  /// Save the player's profile.
  Future<void> savePlayer(PlayerProfile player) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(player.toJson());

    await prefs.setString(_playerKey, jsonString);
  }

  /// Load the player's profile.
  /// Returns null if no save exists.
  Future<PlayerProfile?> loadPlayer() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(_playerKey);

    if (jsonString == null) {
      return null;
    }

    final Map<String, dynamic> json =
    jsonDecode(jsonString) as Map<String, dynamic>;

    return PlayerProfile.fromJson(json);
  }

  /// Returns true if a save exists.
  Future<bool> hasSave() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_playerKey);
  }

  /// Delete the player's save.
  Future<void> deleteSave() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_playerKey);
  }

  /// Start a brand-new game.
  Future<PlayerProfile> createNewPlayer({
    required String name,
    required String gender,
  }) async {
    final player = PlayerProfile(
      name: name,
      gender: gender,
    );

    await savePlayer(player);

    return player;
  }
}