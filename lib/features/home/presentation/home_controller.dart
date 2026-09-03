import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

final class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state = state + 1;
  void reset() => state = 0;
}
