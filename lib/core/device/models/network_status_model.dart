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
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return const NetworkStatusModel(
          isOnline: true,
          connectionType: 'Active Connection',
        );
      }
    } catch (_) {}

    return const NetworkStatusModel(
      isOnline: false,
      connectionType: 'No Connection',
    );
  }
}
