import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
// import '../../../core/failure/failure.dart';
import '../entities/product.dart';
import '../usecases/deleteProduct.dart';


abstract class ProductRepository {
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, Product>> getproduct(String id);
  Future<Either<Failure, List<Product>>> getAllProduct();
  Future<Either<Failure, String>> deleteProduct(String id);
  Future<Either<Failure, Product>> updateProduct(String id);
}