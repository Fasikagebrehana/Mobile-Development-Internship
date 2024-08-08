import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/usecases/getAllProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late GetAllProduct getAllProduct;

  setUp(() {
    mockProductRepository = MockProductRepository();
    getAllProduct = GetAllProduct(mockProductRepository);
  });

  var Productmock = 
    [Product(
      id: '1',
      name: 'All star',
      price: 100,
      imagePath: 'image',
      description: 'Best shoe ',
    ),
    Product(
      id: '2',
      name: 'Vans',
      price: 200,
      imagePath: 'images',
      description: 'Best shoe bleh',
    )]
    ;

    test('Should return a list of products', () async {
      //arrange
      when(mockProductRepository.getAllProduct()).thenAnswer((_) async => Right(Productmock));

      //act
      final result = await getAllProduct.call();

      //assert
      expect(result, Right(Productmock));

    });
}