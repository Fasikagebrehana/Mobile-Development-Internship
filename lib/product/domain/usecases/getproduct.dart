

import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/productRepository.dart';

class GetProduct implements UseCase<Future<Either<Failure, Product>>, String> {
  final ProductRepository repository;
  GetProduct(this.repository);
  
  @override
  Future<Either<Failure, Product>> call(String id) async {
    return await repository.getproduct(id);
  }
  
}