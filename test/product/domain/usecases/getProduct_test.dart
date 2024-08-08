import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/usecases/getproduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late GetProduct getProduct;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getProduct = GetProduct(mockProductRepository);
  });

  var Productmock = 
    Product(
      id: '1',
      name: 'All star',
      price: 100,
      imageUrl: 'image',
      description: 'Best shoe ',
    );
  
  String id = '1';

  test('should return the expected product when repository call is successful', () async {
    //arrange
    when(
      mockProductRepository.getproduct(id)
    ).thenAnswer((_) async => Right(Productmock));

    //act
    final result = await getProduct.call(id);

    //assert
    expect(result, Right(Productmock));
  });
}