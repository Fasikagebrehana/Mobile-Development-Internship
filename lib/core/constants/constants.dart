import '../../product/data/models/product_model.dart';
import '../../product/domain/entities/product.dart';

class Urls{
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';

  static String getproduct(String id) =>
  '$baseUrl/$id';
  static String getAllProduct() => baseUrl;

  static String addProduct(ProductModel product) => baseUrl;

  static String deleteProduct(String id) => '$baseUrl/$id';

  static String updateProduct(String id) => '$baseUrl/$id';
}