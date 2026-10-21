import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameState {
  final String channelName;
  final double balance;
  final int reputation;
  final int day;
  final int week;
  final double averageRating;
  final double yesterdayRating;
  final double weeklyProfit;

  const GameState({
    this.channelName = "Yildiz TV",
    this.balance = 750000.0,
    this.reputation = 65,
    this.day = 1,
    this.week = 1,
    this.averageRating = 4.2,
    this.yesterdayRating = 4.6,
    this.weeklyProfit = 42500.0,
  });

  String get dayName {
    switch (day) {
      case 1:
        return "Pazartesi";
      case 2:
        return "Sali";
      case 3:
        return "Carsamba";
      case 4:
        return "Persembe";
      case 5:
        return "Cuma";
      case 6:
        return "Cumartesi";
      case 7:
        return "Pazar";
      default:
        return "Pazartesi";
    }
  }

  GameState copyWith({
    String? channelName,
    double? balance,
    int? reputation,
    int? day,
    int? week,
    double? averageRating,
    double? yesterdayRating,
    double? weeklyProfit,
  }) {
    return GameState(
      channelName: channelName ?? this.channelName,
      balance: balance ?? this.balance,
      reputation: reputation ?? this.reputation,
      day: day ?? this.day,
      week: week ?? this.week,
      averageRating: averageRating ?? this.averageRating,
      yesterdayRating: yesterdayRating ?? this.yesterdayRating,
      weeklyProfit: weeklyProfit ?? this.weeklyProfit,
    );
  }
}

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(const GameState());

  void advanceNextDay() {
    int nextDay = state.day + 1;
    int nextWeek = state.week;
    if (nextDay > 7) {
      nextDay = 1;
      nextWeek += 1;
    }

    final dailyRevenue = 35000.0 + (state.reputation * 500);
    const dailyExpenses = 28000.0;
    final netProfit = dailyRevenue - dailyExpenses;
    final newRating = ((state.averageRating * 0.85) + (3.6 + (state.reputation % 5) * 0.4)).clamp(1.0, 15.0);

    state = state.copyWith(
      day: nextDay,
      week: nextWeek,
      balance: state.balance + netProfit,
      yesterdayRating: state.averageRating,
      averageRating: newRating,
      weeklyProfit: state.weeklyProfit + netProfit,
    );
  }

  void updateChannelName(String newName) {
    state = state.copyWith(channelName: newName);
  }
}

final gameStateProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GameNotifier();
});