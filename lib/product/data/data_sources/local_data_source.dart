import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<ProductModel> getproduct(String id);
  Future<String> deleteProduct(String id);
  Future<ProductModel> addProduct(ProductModel product);
  Future<List<ProductModel>> getAllProduct();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl extends ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  final String productCacheKey = 'cachedProducts';

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  
  String _getProductCacheKey(String id) => 'productCacheKey_$id';

  @override
  Future<ProductModel> addProduct(ProductModel product) async {
    final productJson = json.encode(product.toJson());
    await sharedPreferences.setString(_getProductCacheKey(product.id), productJson);
    return product;
  }

  @override
  Future<String> deleteProduct(String id) async {
    final success = await sharedPreferences.remove(_getProductCacheKey(id));
    if (success) {
      return 'deleted';
    } else {
      throw Exception('Failed to delete product');
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final keys = sharedPreferences.getKeys();
    final productList = <ProductModel>[];
    for (var key in keys) {
      if (key.startsWith('productCacheKey_')) {
        final productJson = sharedPreferences.getString(key);
        if (productJson != null) {
          productList.add(ProductModel.fromJson(json.decode(productJson)));
        }
      }
    }
    return productList;
  }

  @override
  Future<ProductModel> getproduct(String id) async {
    final productJson = sharedPreferences.getString(_getProductCacheKey(id));
    if (productJson != null) {
      return ProductModel.fromJson(json.decode(productJson));
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    await sharedPreferences.setString(
      productCacheKey,
      jsonEncode(products.map((e) => e.toJson()).toList()),
    );
  }
}
