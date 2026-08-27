import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageRefreshProvider =
    NotifierProvider<StorageRefreshController, int>(
        StorageRefreshController.new);

final class StorageRefreshController extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state = state + 1;
}
