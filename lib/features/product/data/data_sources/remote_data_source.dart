import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/failure/exceptions.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/deleteProduct.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getproduct(String id);
  Future<String> deleteProduct(String id);
  Future<ProductModel> addProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<List<ProductModel>> getAllProduct();
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getproduct(String id) async {
    final url =
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as Map<String, dynamic>;
      return ProductModel.fromJson(jsonList);
    } else {
      throw ServerException('Failed to load product');
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final url =
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as Map<String, dynamic>;
      final jsonData = jsonList['data'];
      List<ProductModel> products = [];
      for (var data in jsonData) {
        products.add(ProductModel.fromJson(data));
      }
      return products;
    } else {
      throw ServerException('Failed to load product');
    }
  }

  @override
  Future<String> deleteProduct(String id) async {
    final url =
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

    final response = await client.delete(Uri.parse(url));
    // print(response);
    final statusCode = response.statusCode;
    // print(json.decode(response.body));

    if (response.statusCode == 200) {
      return 'Product deleted successfully!';
    } else {
      throw ServerException('Failed to Delete product');
    }
  }

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final url =
        'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/';

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = product.name;
    request.fields['description'] = product.description;
    request.fields['price'] = product.price.toString();
    request.files.add(await http.MultipartFile.fromPath(
        'image', product.imageUrl,
        contentType: MediaType('image', 'jpg')));

    final res = await client.send(request);
    final response = await http.Response.fromStream(res);
    // print(response);
    // print(json.decode(response.body));

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonList = json.decode(response.body)["data"];
      return ProductModel.fromJson(jsonList);
    } else {
      throw ServerException('Failed to load product');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    // final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$';
    print(product.toJson());
    try {
      final response = await client.put(Uri.parse(Urls.updateProduct(product.id)),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': product.name,
          'price': product.price,
          'description': product.description
        }));

    print(response.body);
    // print(json.decode(response.body));

    if (response.statusCode == 200) {
      final jsonList =
          json.decode(response.body)['data'] as Map<String, dynamic>;
      return ProductModel.fromJson(jsonList);
    } else {
      throw ServerException('Failed to load product');
    }
    } catch(e){
      throw ServerException(e.toString());
    }
  }
}
