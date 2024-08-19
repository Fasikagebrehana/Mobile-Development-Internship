import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../dependency_injection.dart';
import '../../domain/repositories/productRepository.dart';
import '../../domain/usecases/getAllProduct.dart';
import '../bloc/bloc/add_bloc.dart';
import '../bloc/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // setup();
    // final productRepository = BlocProvider.of<ProductRepository>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 130,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Image.asset(
                //   'images/image.png',
                //   height: 40,
                // ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " July 31, 2024",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Sora',
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Hello, ",
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        Text(
                          "Fasika",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ListTile(
              title: Text(
                "Available Products",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: GestureDetector(
                  onTap: () => {Navigator.of(context).pushNamed('/search')},
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeBloc(GetAllProduct(getIt()))..add(LoadAllProductEvent()),
          ),
          BlocProvider(
            create: (context) => getIt<AddBloc>(),
          ),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              final productWidgets = state.data.map((product) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Cards(product: product),
                  ),
                );
              }).toList();
              return ListView(
                padding: EdgeInsets.all(18.0),
                children: productWidgets,
              );
            } else if (state is FailedState) {
              return Center(
                child: Text('Error: //${state.message}'),
              );
            }
            return Center(
              child: Text('No products available'),
            );
          },
        ),
      ),
    );
  }
}
