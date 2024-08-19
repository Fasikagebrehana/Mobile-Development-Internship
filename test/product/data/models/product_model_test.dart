import 'dart:convert';

import 'package:ecommerce/features/product/data/models/product_model.dart';
import 'package:ecommerce/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';

void main () {
   var testProductModel = ProductModel(
      id: '6672752cbd218790438efdb0',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123,
      imageUrl: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg'
  );

  test('should be subclass of product entity', () async {
    // assert
    expect(testProductModel, isA<Product>());
  });

  test('Should return from json file', () async {
    final Map<String, dynamic> jsonmap = json.decode(
      readJson('helpers/dummy_data/dummy_data.json'),
    )['data'][0];

    final result = ProductModel.fromJson(jsonmap);

    expect(result, equals(testProductModel));
  });

  test('should return a json map containing proper data', () async {
    // act
    final result = testProductModel.toJson();

    // assert
    expect(result, equals(testProductModel.toJson()));

  });
}
