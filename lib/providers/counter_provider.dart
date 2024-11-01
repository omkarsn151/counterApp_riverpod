import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/counter_notifier.dart';

// final counterProvider = StateProvider<int>((ref) => 0);

final counterProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier()..loadCounter();
});
