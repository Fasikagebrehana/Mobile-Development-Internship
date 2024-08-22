import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../repository/UserRepository.dart';

class Login {
  UserRepository userRepository;

  Login(this.userRepository);

  Future<Either<Failure, void>> call(String username, String password) async {
    return userRepository.logIn(username, password);
  }
}