import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/failure/exceptions.dart';
import 'package:ecommerce/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce/product/data/models/product_model.dart';
import 'package:ecommerce/product/domain/usecases/updateProduct.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;


import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;


  setUp(() {
    mockHttpClient = MockClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  String id = "6672752cbd218790438efdb0";

  group('get product', () {
    // var product = ProductRemoteDataSourceImpl(client: http.Client());
    // product.getProducts();
    test('when response is 200 should return product data', () async {
      // arrange 
      when(mockHttpClient.get(Uri.parse(Urls.getproduct(id)
      ))).thenAnswer((_) async => http.Response(
        readJson('helpers/dummy_data/dummy_data.json'), 200
      )
      );
      //act
      final result = await productRemoteDataSourceImpl.getproduct(id);
      // print(result);
      
       // assert
      expect(result, isA<ProductModel>());

    });


    test('when response is 404 or other should return server error', () async {
      // arrange 
      when(mockHttpClient.get(Uri.parse(Urls.getproduct(id)
      ))).thenAnswer((_) async => http.Response(
        'not found', 404
      )
      );
      //act
      final result =  productRemoteDataSourceImpl.getproduct;
      // print(result);
      
       // assert
      expect(() async => await result(id), throwsA(isA<ServerException>()));

    });
  }
  );

  group('delete Product', () {
    String id = "667275bab905525c145fe08f";
    final response = [{
      'id': "6672752cbd218790438efdb0",
      "name": "Anime website",
      "description": "Explore anime characters.",
      "price": 123,
      "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
    }];

      final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
    test('should return deleted product when response is 200', () async {
      // arrange 
      when(mockHttpClient.delete(any)).thenAnswer((_) async => http.Response(
        json.encode(response), 200
      )
      );
      // //act
      final result = await productRemoteDataSourceImpl.deleteProduct(id);
      // // print(result);
      
      //  // assert
      expect(result[0], isA<ProductModel>());
    });
  }
  );

  // group('Add product', (){
  //   final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/';

  //   String id = "1";
  //   final product = [{
  //     'id': "6672752cbd218790438efdb0",
  //     "name": "Anime website",
  //     "description": "Explore anime characters.",
  //     "price": 123,
  //     "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
  //   }];

    
    
    // test('Should Add product', () async {
  //   when(mockHttpClient.post(Uri.parse(Urls.baseUrl), headers: {'Content-Type': 'application/json'},
  //     body: json.encode(product.toJson()))).thenAnswer((_) async => http.Response(json.encode(product.toJson()), 201));

  //   final result = await productRemoteDataSourceImpl.addProduct(product);
  
  //   expect(result, isA<ProductModel>());
  //  });
  // });
  group('get All Product', () {
    // var product = ProductRemoteDataSourceImpl(client: http.Client());
    // product.getProducts();
    test('when response is 200 should return product data', () async {
      // arrange 
      when(mockHttpClient.get(any
)).thenAnswer((_) async => http.Response(
        readJson('helpers/dummy_data/dummy_data.json'), 200
      )
      );
      //act
      final result = await productRemoteDataSourceImpl.getAllProduct();
      // print(result);
      
       // assert
      expect(result, isA<List<ProductModel>>());

    });
  });
   
  group('update Product', () {
    // var product = ProductRemoteDataSourceImpl(client: http.Client());
    // product.getProducts();
      final updateData = {
      'name': 'Updated Product Name',
      'description': 'Updated Description',
      'price': 200,
    };

    final productJson = {
        'id': id,
        ...updateData,
        'imageUrl': 'https://example.com/path/to/image.jpg' // Example image URL
      };
    test('when response is 200 should return update data', () async {

      // arrange 
      when(mockHttpClient.put(Uri.parse(Urls.updateProduct(id))
)).thenAnswer((_) async => http.Response(
        json.encode(productJson), 200
      )
      );
      //act
      final result = await productRemoteDataSourceImpl.updateProduct(id);
      // print(result);
      
       // assertgetAllProduct
      expect(result, isA<ProductModel>());

    });
  });
}

