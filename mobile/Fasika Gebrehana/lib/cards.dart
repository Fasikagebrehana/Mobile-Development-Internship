import 'package:flutter/material.dart';
import 'details_page.dart';
import 'product.dart';
import 'dart:io';

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    product: product,
                  )),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                child: _buildImage(context, product.imagePath),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.type,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '(${product.rating})',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300),
                        ),
                      ])
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imagePath) {
    if (imagePath.startsWith('images/')) {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
      );
    } else {
      return Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.9,
      );
    }
  }
}
