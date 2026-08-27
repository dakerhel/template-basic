import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/home_repository_impl.dart';

final greetingProvider = FutureProvider<void>((ref) {
  return ref.watch(homeRepositoryProvider).loadGreeting();
});

final counterProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

final class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state = state + 1;
}
