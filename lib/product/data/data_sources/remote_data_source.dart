import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../core/constants/constants.dart';
import '../../../core/failure/exceptions.dart';
import '../../domain/usecases/deleteProduct.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getproduct(String id);
  Future<String> deleteProduct(String id);
  Future<ProductModel> addProduct(ProductModel product);
  Future<ProductModel> updateProduct(String id);
  Future<List<ProductModel>> getAllProduct();


}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{

  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> getproduct(String id) async {
  final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body) as Map<String, dynamic>;
    return ProductModel.fromJson(jsonList);
  }else {
    throw ServerException('Failed to load product');
  }
}



@override
  Future<List<ProductModel>> getAllProduct() async {
  final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/';

  final response = await client.get(Uri.parse(url));

  if (response.statusCode == 200) {

    final jsonList = json.decode(response.body) as Map<String, dynamic>;
    final jsonData = jsonList['data'];
    List<ProductModel> products = [];
    for (var data in jsonData){
      products.add(ProductModel.fromJson(data));
    }
    return products;
  }else {
    throw ServerException('Failed to load product');
  }
}

  
  @override
  Future<String> deleteProduct(String id) async {
  final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';

  final response = await client.delete(Uri.parse(url));
  // print(response);
  final statusCode = response.statusCode;
  // print(json.decode(response.body));

  if (response.statusCode == 200) {
    return 'Product deleted successfully!';
  }else {
    throw ServerException('Failed to Delete product');
  }
}



@override
  Future<ProductModel> addProduct(ProductModel product) async {
  final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/';

  final request = http.MultipartRequest('POST', Uri.parse(url));
  request.fields['name'];
  request.fields['description'];
  request.fields['price'];
  request.files.add(await http.MultipartFile.fromPath('image', product.imageUrl));

  final res = await client.send(request);
  final response = await http.Response.fromStream(res);
  // print(response);
  // print(json.decode(response.body));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonList = json.decode(response.body);
    return ProductModel.fromJson(jsonList);
  }else {
    throw ServerException('Failed to load product');
  }
}


@override
  Future<ProductModel> updateProduct(String id) async {
  // final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$';

  final response = await client.put(Uri.parse(Urls.updateProduct(id)));
  // print(response);
  // print(json.decode(response.body));

  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body) as Map<String, dynamic>;
    return ProductModel.fromJson(jsonList);
  }else {
    throw ServerException('Failed to load product');
  }
}
}