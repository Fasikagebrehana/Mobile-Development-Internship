import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../repository/UserRepository.dart';

class Profile {
  late UserRepository userRepository;

  Profile(this.userRepository);

  Future<Either<Failure, User>> call() async {
    print(userRepository.profile());
    return userRepository.profile();
  }
}