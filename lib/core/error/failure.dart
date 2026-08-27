sealed class Failure {
  const Failure(this.message);

  final String message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Нет соединения с сетью']);
}

final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Ошибка сервера']);
}

final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Ошибка локального хранилища']);
}

final class UpdateFailure extends Failure {
  const UpdateFailure([super.message = 'Ошибка обновления']);
}
