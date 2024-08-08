
import 'package:dartz/dartz.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/repositories/productRepository.dart';
import 'package:ecommerce/product/domain/usecases/addProduct.dart';
import 'package:ecommerce/product/domain/usecases/deleteProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';
// import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockproductepository;
  late Deleteproduct deleteproduct;

  setUp(() {
    mockproductepository = MockProductRepository();
    deleteproduct = Deleteproduct(mockproductepository);
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

  test('Delete a product', () async {
    //arrange
    when(
      mockproductepository.deleteproduct(id)
    ).thenAnswer((_) async => Right(Productmock));

    final result = await deleteproduct.call(id);

    expect(result,  Right(Productmock));
  });

}
