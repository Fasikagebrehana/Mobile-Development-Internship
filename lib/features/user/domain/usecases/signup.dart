import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../repository/UserRepository.dart';

class SignupUsecase {
  UserRepository userRepository;

  SignupUsecase(this.userRepository);

  Future<Either<Failure, User>> call(String name, String username, String password) async {
    return userRepository.signUp(name, username, password);
  }
}