import 'package:dartz/dartz.dart';
import '../../../core/failure/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/productRepository.dart';

class Addproduct implements UseCase<Future<Either<Failure, Product>>, Product> {
  final ProductRepository repository;

  Addproduct(this.repository);
  
  @override
  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.addProduct(product);
  }
  
}