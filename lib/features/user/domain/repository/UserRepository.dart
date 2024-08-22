import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../usecases/profile.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> logIn(String username, String password);
  Future<Either<Failure, User>> signUp(String name, String username, String password);
  Future<Either<Failure, User>> profile();
}