import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});

final class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<void> loadGreeting() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
  }
}
