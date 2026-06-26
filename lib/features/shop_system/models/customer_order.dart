class CustomerOrder {
  final String id;
  final String potionName;
  final int patience;

  int remainingTime;
  bool served = false;

  String emotion = "neutral"; // 😐 neutral / 😡 angry / 😊 happy

  CustomerOrder({
    required this.id,
    required this.potionName,
    required this.patience,
  }) : remainingTime = patience;

  bool get isExpired => remainingTime <= 0;
  bool get isWaiting => !served && !isExpired;

  void tick() {
    if (remainingTime > 0 && !served) {
      remainingTime--;

      _updateEmotion();
    }
  }

  void _updateEmotion() {
    final percent = remainingTime / patience;

    if (percent <= 0.3) {
      emotion = "angry"; // 😡 panic state
    } else if (percent <= 0.7) {
      emotion = "neutral"; // 😐 waiting
    } else {
      emotion = "happy"; // 😊 early patience phase
    }
  }

  void serve(String potion) {
    if (potion == potionName) {
      served = true;
      emotion = "happy"; // 😊 satisfied customer
    }
  }
}