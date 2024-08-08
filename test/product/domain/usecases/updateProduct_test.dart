import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/usecases/updateProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late UpdateProduct updateProduct;

  setUp(() {
    mockProductRepository = MockProductRepository();
    updateProduct = UpdateProduct(mockProductRepository);
  });

  var Productmock = 
    Product(
      id: '1',
      name: 'All star',
      price: 100,
      imagePath: 'image',
      description: 'Best shoe ',
    );

  String id = '1';

  test('Delete a product', () async {
    when(mockProductRepository.updateProduct(id)).thenAnswer((_) async => Right(Productmock));

    final result = await updateProduct.call(id);

    expect(result, Right(Productmock));
  });
}