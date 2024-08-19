import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entities/product.dart';
import '../repositories/productRepository.dart';

class UpdateProduct {
  ProductRepository repository;

  UpdateProduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(Product product) async {
    return await repository.updateProduct(product);
  }
  }
