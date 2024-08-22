import '../../../../core/failure/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repository/UserRepository.dart';
import '../data_sources/user_local_data_source.dart';
import '../data_sources/user_remote_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {

  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource, required this.userLocalDataSource});

  @override
  Future<Either<Failure, void>> logIn(String username, String password) async{
    // TODO: implement logIn
    try{
      final remoteUser = await userRemoteDataSource.logIn(username, password);
      







      return const Right(null);
      // print(remoteUser);
      // final users = UserModel.fromUser(remoteUser);
      // userLocalDataSource.cacheUser(remoteUser);
      // return Right(remoteUser);
    }on ServerException {
      throw const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signUp(String name, String username, String password) async{
    // TODO: implement signUp
    try {
      final remoteUser = await userRemoteDataSource.Register(name, username, password);
      final users = UserModel.fromUser(remoteUser);
      userLocalDataSource.cacheUser(users);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } catch(e) {
      return Left(CacheFailure("$e"));
    }
    
  }

  @override
  Future<Either<Failure, User>> getLastUser() async {
    try {
      final lastUser = await userLocalDataSource.getLastUser();
      if (lastUser != null) {
        return Right(lastUser);
      }
      else {
        return  Left(CacheFailure("hkhjkh"));
      }
    } catch(e) {
      return Left(CacheFailure("ghjgjh"));
    }
  }

  @override
  Future<void> logout() async {
    await userLocalDataSource.clearCache();
  }
  
  @override
  Future<Either<Failure, User>> profile() async{
    // TODO: implement profile
    try {
      final remoteUser = await userRemoteDataSource.Profile();
      final users = UserModel.fromUser(remoteUser);
      userLocalDataSource.cacheUser(users);
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } catch(e) {
      return Left(CacheFailure("$e"));
    }
  }
}