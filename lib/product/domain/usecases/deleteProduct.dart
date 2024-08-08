import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/usecases/deleteProduct.dart';

import '../../../core/failure/failure.dart';
import '../entities/product.dart';
import '../repositories/productRepository.dart';
import 'deleteProduct.dart';

class Deleteproduct {
  final ProductRepository repository;

  Deleteproduct(this.repository);

  @override
  Future<Either<Failure, Product>> call(String id) async {
    return await repository.deleteproduct(id);
  }
  }
