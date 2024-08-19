import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/failure/failure.dart';
import 'core/network/network_info.dart';
import 'dependency_injection.dart';
import 'features/product/data/data_sources/local_data_source.dart';
import 'features/product/data/data_sources/remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/productRepository.dart';
import 'features/product/domain/usecases/addProduct.dart';
import 'features/product/domain/usecases/deleteProduct.dart';
import 'features/product/domain/usecases/getAllProduct.dart';
import 'features/product/domain/usecases/getproduct.dart';
import 'features/product/domain/usecases/updateProduct.dart';
// import 

GetIt getIt = GetIt.instance;

Future<void> setup() async{
  var client = http.Client();
  var connectiivity = InternetConnectionChecker();
  var sharedPreference = await SharedPreferences.getInstance();
  
  getIt.registerSingleton<InternetConnectionChecker>(connectiivity);
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(internetConnectionChecker: getIt<InternetConnectionChecker>()),);
  getIt.registerSingleton<SharedPreferences>(sharedPreference);
  getIt.registerSingleton<http.Client>(client);
  getIt.registerSingleton<ProductRemoteDataSource>(ProductRemoteDataSourceImpl(client: getIt()));
  getIt.registerSingleton<ProductLocalDataSource>(ProductLocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(productLocalDataSource: getIt(),productRemoteDataSource: getIt(), networkInfo: getIt()));
  // getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(productRemoteDataSource: getIt(), networkInfo: getIt(), productLocalDataSource: getIt()));
  getIt.registerSingleton<GetAllProduct>(GetAllProduct(getIt()));
  getIt.registerSingleton<GetProduct>(GetProduct(getIt()));
  getIt.registerSingleton<Addproduct>(Addproduct(getIt()));
  getIt.registerSingleton<UpdateProduct>(UpdateProduct(getIt()));
    getIt.registerSingleton<Deleteproduct>(Deleteproduct(getIt()));

  
}