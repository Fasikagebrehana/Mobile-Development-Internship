import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/exceptions.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/productRepository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository {

  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;
  final ProductLocalDataSource productLocalDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource, required this.networkInfo, required this.productLocalDataSource});


  @override
  Future<Either<Failure, Product>> addProduct(Product product) async {
    if (await networkInfo.isConnected){
    try {
      final productmodel = ProductModel.fromEntity(product);
      final result = await productRemoteDataSource.addProduct(productmodel);
      productLocalDataSource.addProduct(result);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  } else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {
    if (await networkInfo.isConnected){
    try {
      final result = await productRemoteDataSource.deleteProduct(id);
       await productLocalDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }
  else{
    return const Left(ConnectionFailure('No internet connection'));
  }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    if (await networkInfo.isConnected){
    try {
      final result = await productRemoteDataSource.getAllProduct();
       await productLocalDataSource.cacheProducts(result);
      return Right(result.map((product) => product.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
    }else{
      try {
        final localProducts = await productLocalDataSource.getAllProduct();
        return Right(localProducts.map((product) => product.toEntity()).toList());
      } catch (e) {
        return  Left(CacheFailure('$e'));
      }
    }
  }

  @override
  Future<Either<Failure, Product>> updateProduct(Product product) async {
    if (await networkInfo.isConnected){
    try {
      final result = await productRemoteDataSource.updateProduct(ProductModel.fromEntity(product));
       await productLocalDataSource.addProduct(result);
       var productL = result.toEntity();
      return Right(productL);
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    } 
    }else {
      return const Left(ConnectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Product>> getproduct(String id) async {
    if (await networkInfo.isConnected){
    try {
      final result = await productRemoteDataSource.getproduct(id);
      productLocalDataSource.addProduct(result);

      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return const Left(ServerFailure('Unexpected error'));
    }
  }
  else{
    try {
        final localProduct = await productLocalDataSource.getproduct(id);
        return Right(localProduct.toEntity());
      } catch (e) {
        return  Left(CacheFailure('Product not found in local cache'));
      }
  }
  }

}
