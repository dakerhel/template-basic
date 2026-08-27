import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';
import 'data/repositories/update_repository_impl.dart';
import 'domain/repositories/update_repository.dart';

final updateRepositoryProvider = Provider<UpdateRepository>((ref) {
  return UpdateRepositoryImpl(ref.watch(apiClientProvider));
});
