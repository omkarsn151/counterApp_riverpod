import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getInt('counter') ?? 0;
  }

  Future<void> increment() async {
    state++;
    await _saveCounter();
  }

  Future<void> decrement() async {
    if (state > 0) {
      state--;
      await _saveCounter();
    }
  }

  Future<void> reset() async {
    state = 0;
    await _saveCounter();
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', state);
  }
}
