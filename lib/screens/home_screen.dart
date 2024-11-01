import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter/screens/next_screen.dart';
import '../providers/counter_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterValue = ref.watch(counterProvider);
    final counterNotifier = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Counter = $counterValue'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (counterValue == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Counter is already zero!')));
                      } else {
                        // ref.read(counterProvider.notifier).state--;
                        counterNotifier.decrement();
                      }
                    },
                    icon: const Icon(
                      Icons.remove_circle_rounded,
                      size: 70,
                    )),
                IconButton(
                    onPressed: () {
                      // ref.read(counterProvider.notifier).state++;
                      counterNotifier.increment();
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 70,
                    )),
                IconButton(
                    onPressed: () {
                      // final resetCounter = ref.refresh(counterProvider);
                      final resetCounter = counterNotifier.reset();

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Counter reset to $resetCounter')));
                      // ref.refresh(counterProvider);
                    },
                    icon: const Icon(Icons.refresh_rounded))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NextScreen()));
                },
                child: const Text('Next PAge')),
          ],
        ),
      ),
    );
  }
}
