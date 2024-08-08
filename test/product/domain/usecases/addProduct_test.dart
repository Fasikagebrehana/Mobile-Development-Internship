
import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/repositories/productRepository.dart';
import 'package:ecommerce/product/domain/usecases/addProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
// import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockproductepository;
  late Addproduct addproduct;

  setUp(() {
    mockproductepository = MockProductRepository();
    addproduct = Addproduct(mockproductepository);
  });

  var Productmock = 
    Product(
      id: '1',
      name: 'All star',
      price: 100,
      imageUrl: 'image',
      description: 'Best shoe ',
    );
  

  test('Add product', () async {
    //arrange
    when(
      mockproductepository.addProduct(Productmock)
    ).thenAnswer((_) async => Right(Productmock));

    final result = await addproduct.call(Productmock);

    expect(result,  Right(Productmock));
  });

}
