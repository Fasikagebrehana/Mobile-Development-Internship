import 'package:ecommerce/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce/features/product/domain/repositories/productRepository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
@GenerateMocks(
  [
    ProductRepository,
    http.Client,
    ProductRemoteDataSource
  ],
)

void main() {

}