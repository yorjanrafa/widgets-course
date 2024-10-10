import 'package:a01_widgets/presentation/providers/counter_provider.dart';
import 'package:a01_widgets/presentation/providers/theme_provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = "Counter Screen";
  CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
            },
            icon: FadeIn(
              child: Icon(
                isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('clicks: $clickCounter'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ref.read(counterProvider.notifier).state++;
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: const Icon(Icons.add)),
    );
  }
}
