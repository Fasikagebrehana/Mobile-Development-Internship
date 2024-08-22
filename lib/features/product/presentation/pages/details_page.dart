import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:/product.dart';
// import 'package:practice/update.dart';
import '../../domain/entities/product.dart';
import '../bloc/bloc/delete_bloc.dart';
import '../bloc/bloc/home_bloc.dart';
import 'add.dart';
import 'animation_route.dart';
import 'update.dart';
// import 'animationRoute.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 29),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  // child: product.imageUrl.startsWith('images/')?
                                  child: Image.network(
                                    product.imageUrl,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )
                                  // : Image.file(
                                  //     File(product.imageUrl),
                                  //     fit: BoxFit.cover,
                                  //     width: double.infinity,
                                  //   ),
                                  ),
                            ),
                            Positioned(
                              left: 10,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.only(left: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              // Row(
                              //   children: [
                              //     Text(
                              //       product.type,
                              //       style: TextStyle(fontSize: 18, color: Colors.grey),
                              //     ),
                              //     Spacer(),
                              //     Icon(Icons.star, color: Colors.amber),
                              //     SizedBox(width: 5),
                              //     Text(product.rating.toString()),
                              //   ],
                              // ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  SizedBox(height: 8),
                                  Text(
                                    '\$${product.price}',
                                    // product.price.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Size:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              ShoeSize(),
                              SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  product.description,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.23),
                              Row(
                                children: [
                                  Expanded(
                                    child:
                                        BlocConsumer<DeleteBloc, DeleteState>(
                                      listener: (context, state) {
                                        if(state is DeleteLoadedState){
                                          context.read<HomeBloc>().add(LoadAllProductEvent());
                                          Navigator.pushNamed(context, "/home");
                                        } else if(state is DeleteFailedState){
                                           
                                        }
                                        // TODO: implement listener
                                      },
                                      builder: (context, state) {
                                        return BlocBuilder<DeleteBloc,
                                            DeleteState>(
                                          builder: (context, state) {
                                            return OutlinedButton(
                                              onPressed: () {
                                                context.read<DeleteBloc>().add(
                                                    DeleteProductEvent(
                                                        product.id));
                                              },
                                              
                                              child: Text("DELETE"),
                                              style: OutlinedButton.styleFrom(
                                                  foregroundColor: Colors.red,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7)),
                                                  side: BorderSide(
                                                      color: Colors.red)),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 36),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                            "/update",
                                            arguments: product);
                                      },
                                      child: const Text("UPDATE",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ]))));

    //             else {
    //                 return Image.file(
    //                   File(imageUrl),
    //                   fit: BoxFit.cover,
    //                   height: MediaQuery.of(context).size.height * 0.2,
    //                   width: MediaQuery.of(context).size.width * 0.9,
    //                 );
    //               }
    //                         ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}

class ShoeSize extends StatefulWidget {
  const ShoeSize({Key? key}) : super(key: key);

  @override
  State<ShoeSize> createState() => _ShoeSizeState();
}

class _ShoeSizeState extends State<ShoeSize> {
  int _selectedSizeIndex = 2; // Default selected size index (41)

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          6,
          (index) {
            bool isSelected = _selectedSizeIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSizeIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ]
                      : [],
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade200,
                  ),
                ),
                child: Text(
                  (39 + index).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
