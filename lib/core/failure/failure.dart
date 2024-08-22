import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;

  const Failure(this.message);

  @override
  String toString() => 'Failure: $message';

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'A server failure occurred.']) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([String message = 'A connection failure occurred.']) : super(message);
}

class LocalDataSourceFailure extends Failure {
  const LocalDataSourceFailure([String message = 'A local data source failure occurred.']) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}
