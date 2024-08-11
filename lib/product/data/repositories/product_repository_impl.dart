import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../core/failure/exceptions.dart';
import '../../../core/failure/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/productRepository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository {

  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    try {
      final productmodel = ProductModel.fromEntity(product);
      final result = await productRemoteDataSource.addProduct(productmodel);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {
    try {
      final result = await productRemoteDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    try {
      final result = await productRemoteDataSource.getAllProduct();
      return Right(result.map((product) => product.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(String id) async {
    try {
      final result = await productRemoteDataSource.updateProduct(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, Product>> getproduct(String id) async {
    try {
      final result = await productRemoteDataSource.getproduct(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }

}
