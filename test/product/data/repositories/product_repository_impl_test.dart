import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/failure/exceptions.dart';
import 'package:ecommerce/core/failure/failure.dart';
import 'package:ecommerce/product/data/models/product_model.dart';
import 'package:ecommerce/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce/product/domain/entities/product.dart';
import 'package:ecommerce/product/domain/repositories/productRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductRepositoryImpl productRepositoryImp;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImp = ProductRepositoryImpl(productRemoteDataSource: mockProductRemoteDataSource,);
  }); 
  var testProductModel = ProductModel(
    id: "6672752cbd218790438efdb0",
    name: "Anime website",
    price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
    description:  "Explore anime characters.",
     );

  var testProductEntity = Product(
    id: "6672752cbd218790438efdb0",
    name: "Anime website",
    price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
    description:  "Explore anime characters.",
    );

  const id = "6672752cbd218790438efdb0";
  group('get product', () {
    test('get a product', () async {
  // Arrange
    when(mockProductRemoteDataSource.getproduct(id)).thenAnswer((_) async => testProductModel);

  // Act
    final result = await productRepositoryImp.getproduct(id);
  
  // Assert
    expect(result, equals(Right(testProductEntity)));
  });

    test('should return server failure', () async {
  // Arrange
    when(mockProductRemoteDataSource.getproduct(id))
    .thenThrow(ServerException());

  // Act
    final result = await productRepositoryImp.getproduct(id);
    result.fold((l)=>expect(l, equals((ServerFailure('An error has occurred')))), (r)=>null);
  
  
  });

  test('should return connection failure', () async {
  // Arrange
    when(mockProductRemoteDataSource.getproduct(id))
    .thenThrow(SocketException('Failed to connect to the network'));

  // Act
    final result = await productRepositoryImp.getproduct(id);
    result.fold((l)=>expect(l, equals((ConnectionFailure('Failed to connect to the network')))), (r)=>null);
  
  
  });
    }
    );


}
