import 'dart:io';

class NetworkStatusModel {
  const NetworkStatusModel({
    required this.isOnline,
    required this.connectionType,
  });

  final bool isOnline;
  final String connectionType;

  static Future<NetworkStatusModel> check() async {
    try {
      final result = await InternetAddress.lookup('cloudflare.com')
          .timeout(const Duration(seconds: 3));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return const NetworkStatusModel(
          isOnline: true,
          connectionType: 'Active Connection',
        );
      }
    } catch (_) {
      try {
        final fallback = await InternetAddress.lookup('google.com')
            .timeout(const Duration(seconds: 3));
        if (fallback.isNotEmpty && fallback[0].rawAddress.isNotEmpty) {
          return const NetworkStatusModel(
            isOnline: true,
            connectionType: 'Active Connection',
          );
        }
      } catch (_) {}
    }

    return const NetworkStatusModel(
      isOnline: false,
      connectionType: 'No Connection',
    );
  }
}
