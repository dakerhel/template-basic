import 'package:flutter/widgets.dart';

abstract interface class AppLocalizedError {
  String toLocalizedMessage(BuildContext context);
}

class NetworkTimeoutError implements AppLocalizedError {
  const NetworkTimeoutError();

  @override
  String toLocalizedMessage(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    switch (lang) {
      case 'ru':
        return 'Превышено время ожидания ответа сервера';
      case 'zh':
        return '服务器连接超时';
      case 'es':
        return 'Tiempo de espera de la conexión agotado';
      case 'de':
        return 'Zeitüberschreitung der Serververbindung';
      case 'fr':
        return 'Délai d\'attente de la connexion dépassé';
      case 'ar':
        return 'انتهت مهلة الاتصال بالخادم';
      default:
        return 'Connection timeout. Please try again.';
    }
  }
}

class NoInternetError implements AppLocalizedError {
  const NoInternetError();

  @override
  String toLocalizedMessage(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    switch (lang) {
      case 'ru':
        return 'Отсутствует подключение к интернету';
      case 'zh':
        return '无网络连接';
      case 'es':
        return 'Sin conexión a Internet';
      case 'de':
        return 'Keine Internetverbindung';
      case 'fr':
        return 'Pas de connexion Internet';
      case 'ar':
        return 'لا يوجد اتصال بالإنترنت';
      default:
        return 'No internet connection';
    }
  }
}

class ServerError implements AppLocalizedError {
  const ServerError([this.statusCode]);
  final int? statusCode;

  @override
  String toLocalizedMessage(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final codeStr = statusCode != null ? ' ($statusCode)' : '';
    switch (lang) {
      case 'ru':
        return 'Ошибка сервера$codeStr. Повторите попытку позже';
      case 'zh':
        return '服务器错误$codeStr，请稍后重试';
      case 'es':
        return 'Error del servidor$codeStr. Inténtelo más tarde';
      case 'de':
        return 'Serverfehler$codeStr. Bitte später versuchen';
      case 'fr':
        return 'Erreur du serveur$codeStr. Veuillez réessayer plus tard';
      case 'ar':
        return 'خطأ في الخادم$codeStr. يرجى المحاولة لاحقاً';
      default:
        return 'Server error$codeStr. Please try again later.';
    }
  }
}

class ValidationError implements AppLocalizedError {
  const ValidationError(this.fieldName);
  final String fieldName;

  @override
  String toLocalizedMessage(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    switch (lang) {
      case 'ru':
        return 'Некорректное значение поля: $fieldName';
      case 'zh':
        return '字段值无效: $fieldName';
      case 'es':
        return 'Valor de campo no válido: $fieldName';
      case 'de':
        return 'Ungültiger Feldwert: $fieldName';
      case 'fr':
        return 'Valeur de champ non valide : $fieldName';
      case 'ar':
        return 'قيمة حقل غير صحيحة: $fieldName';
      default:
        return 'Invalid value for $fieldName';
    }
  }
}
