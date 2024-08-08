import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/productRepository.dart';

class GetAllProduct {
  final ProductRepository repository;

  GetAllProduct(this.repository);

  // @override
  Future<Either<Failure, List<Product>>> call() async{
    return await repository.getAllProduct();
  }
}

