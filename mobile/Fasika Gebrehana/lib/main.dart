import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'add.dart';
import 'cards.dart';
import 'productprovider.dart';
import 'search.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Add()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        title: Row(
          children: [
            Image.asset(
              'images/image.png',
              height: 40,
            ),
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
                    fontSize: 13,
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
                      ),
                    ),
                    Text(
                      "Fasika",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return ListView.builder(
            padding: EdgeInsets.all(18.0),
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Cards(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
