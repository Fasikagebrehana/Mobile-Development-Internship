import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dependency_injection.dart';
import 'features/product/data/data_sources/remote_data_source.dart';
import 'features/product/data/models/product_model.dart';
import 'features/product/domain/entities/product.dart';
import 'features/product/domain/repositories/productRepository.dart';
import 'features/product/presentation/bloc/bloc/add_bloc.dart';
import 'features/product/presentation/bloc/bloc/delete_bloc.dart';
import 'features/product/presentation/bloc/bloc/home_bloc.dart';
import 'features/product/presentation/bloc/bloc/update_bloc.dart';
import 'features/product/presentation/pages/add.dart';
import 'features/product/presentation/pages/details_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/search.dart';
import 'features/user/presentation/bloc/bloc/login_bloc.dart';
import 'features/user/presentation/bloc/bloc/profile_bloc.dart';
import 'features/user/presentation/bloc/bloc/signup_bloc.dart';
import 'features/user/presentation/pages/login.dart';
import 'features/user/presentation/pages/signup.dart';
import 'features/user/presentation/pages/splash_screen.dart';
import 'features/product/presentation/pages/update.dart';

void main() async {
  // var dataSource = ProductRemoteDataSourceImpl(client: http.Client());
  // var products = await dataSource.getAllProduct();
  // print("product Listed");
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // ProductRemoteDataSourceImpl productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: http.Client());
  //  final result =  await productRemoteDataSourceImpl.updateProduct(ProductModel(id: "66bf1b233b4ddf8b56f354ac", name: "three", price: 123, imageUrl: "imageUrl", description: "not obvious"));
  //  print(result);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // MaterialApp(
    //   home: SplashScreen(),
    //   routes: {
    //     '/login': (context) => Login(),
    //       '/signup': (context) => Signup(),
    //       '/home' : (context) => HomePage(),
    //   },
    // );
    
  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(getIt()),
        ),
        BlocProvider(
          create: (context) => UpdateBloc(getIt()),
        ),
        BlocProvider(create: (context) => DeleteBloc(getIt())),
        BlocProvider(
          create: (context) => LoginBloc(getIt()),
        ),
        BlocProvider(
          create: (context) => SignupBloc(getIt()),
        ),
        BlocProvider(create: (context)=> ProfileBloc(getIt())),
        
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: (setting){
          if(setting.name == "/update"){
            final product = setting.arguments as Product;
            return MaterialPageRoute(builder: (context){
              return UpdatePage(product: product);
            });
          } else if(setting.name == "/detail") {
            final product = setting.arguments as Product;
            return MaterialPageRoute(builder: (context){
              return DetailsPage(product: product);
            });
          }
          return null;
        },
        routes: {
          '/': (context) => SplashScreen(),

          '/add': (context) => BlocProvider(
                create: (context) => AddBloc(getIt()),
                child: AddProductPage(),
              ),
          '/search': (context) => const Search(),
          '/home': (context) => MultiBlocProvider(
            providers: [            
              BlocProvider(create: (context)=> HomeBloc(getIt())),             
              BlocProvider(create: (context)=> ProfileBloc(getIt())),
              
            ],
            child: HomePage()),
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          
        },
        debugShowCheckedModeBanner: false
      ),
    );
  }
}
