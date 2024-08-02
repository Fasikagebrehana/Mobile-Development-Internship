import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details_page.dart';
import 'product.dart';

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
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Padding(padding: EdgeInsets.all(10.0)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                product.price.toString(),
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w500),
              ),
            ]),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                product.type,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  // fontSize: 2,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Row(children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(
                  width: 2.0,
                ),
                Text(
                  product.rating.toString(),
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w300),
                ),
              ])
            ]),
            // )
          ],
        ),
      ),
    );
  }
}
