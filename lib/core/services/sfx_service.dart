import 'package:flutter/foundation.dart';

class SfxService {
  SfxService._();

  static final SfxService instance = SfxService._();

  void play(String event) {
    switch (event) {
      case "brew":
        debugPrint("🔊 brew sound");
        break;

      case "serve":
        debugPrint("🔊 serve sound");
        break;

      case "combo":
        debugPrint("🔊 combo sound");
        break;

      case "panic":
        debugPrint("🔊 panic sound");
        break;

      default:
        debugPrint("🔊 unknown sound: $event");
    }
  }
}