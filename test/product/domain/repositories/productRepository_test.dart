import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/features/product/domain/usecases/deleteProduct.dart';
import '../entities/product.dart';


abstract class Productrepository {
  Future<Either<Failure, Product>> addProduct(Product product);
  Future<Either<Failure, Product>> getproduct(String id);
  Future<Either<Failure, List<Product>>> getAllProduct();
  Future<Either<Failure, String>> deleteproduct(String id);


}