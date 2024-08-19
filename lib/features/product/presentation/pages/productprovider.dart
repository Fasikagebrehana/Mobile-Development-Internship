// import 'package:flutter/material.dart';
// import '../../domain/entities/product.dart';
// // import 'product.dart';

// class ProductProvider with ChangeNotifier {
//   // final List<Product> _products = [
//   //   Product(
//   //     imageUrl: "images/shoes.jpg",
//   //     name: "Derby Leather",
//   //     price: 120.0,
//   //     // type: "Men's shoe",
//   //     rating: 3.5,
//   //     description:
//   //         "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
//   //   ),
//   //   Product(
//   //     imageUrl: "images/vans.jpg",
//   //     name: "Vans Off the wall",
//   //     price: 259.0,
//   //     // type: "Women's and Men's shoe",
//   //     rating: 4.5,
//   //     description:
//   //         "Vans shoes have been an iconic symbol of youthful energy, creativity, and individuality since their inception in 1966. Founded by Paul Van Doren, the brand quickly became a staple in the skateboarding community and has since evolved into a global phenomenon. Vans shoes are renowned for their simple yet versatile design. The classic styles, such as the Authentic, Era, Old Skool, and Sk8-Hi, feature a minimalist silhouette with a low-top or high-top profile.",
//   //   ),
//   //   Product(
//   //     imageUrl: "images/converse.jpg",
//   //     name: "All star converse",
//   //     price: 300.0,
//   //     // type: "Women's shoe",
//   //     rating: 5.0,
//   //     description:
//   //         "The Converse All Star, also known as Chuck Taylor All Stars or simply Chucks has stood the test of time as one of the most iconic and enduring shoes in history. First introduced in 1917, these sneakers have transcended their original purpose as basketball shoes to become a global symbol of style and individuality. Converse All Stars are instantly recognizable by their distinct high-top or low-top silhouette, rubber toe cap, and vulcanized rubber sole.",
//   //   ),
//   //   Product(
//   //     imageUrl: "images/nike.jpg",
//   //     name: "Nike Snickers",
//   //     price: 200.0,
//   //     // type: "Women's shoe",
//   //     // rating: 3.5,
//   //     description:
//   //         "Nike sneakers have become synonymous with cutting-edge athletic performance and trendsetting style since the brand's founding in 1964. Known for their innovative designs, advanced technology, and iconic swoosh logo, Nike has revolutionized the footwear industry. From the groundbreaking Air cushioning system to the Flyknit material, Nike continually pushes the boundaries of what athletic footwear can achieve. These sneakers cater to a wide range of sports, including running, basketball, soccer, and more, while also becoming a staple in streetwear fashion. Celebrities, athletes, and everyday consumers alike flock to Nike for shoes that not only enhance performance but also make a bold fashion statement.",
//   //   ),
//   //   Product(
//   //     imageUrl: "images/jordan.jpg",
//   //     name: "Nike",
//   //     price: 23000,
//   //     type: "Men's shoe",
//   //     rating: 3.5,
//   //     description:
//   //         "Air Jordan sneakers, launched in 1984 in collaboration with basketball icon Michael Jordan, have transcended their athletic roots to become a global cultural phenomenon. Originally designed to provide exceptional performance on the basketball court, Air Jordans feature cutting-edge technology and innovative design elements, such as the revolutionary Air cushioning system, ensuring optimal comfort and support for athletes. The iconic silhouette, bold colorways, and distinctive Jumpman logo have made Air Jordans a coveted item in both sports and fashion circles. ",
//   //   ),
//   // ];

//   List<Product> get products => _products;

//   void addProduct(Product product) {
//     _products.add(product);
//     notifyListeners();
//   }

//   void updateProduct(Product oldProduct, Product newProduct) {
//     final int index = _products.indexWhere((p) => p == oldProduct);
//     if (index != -1) {
//       _products[index] = newProduct;
//       notifyListeners();
//     }
//   }

//   void deleteProduct(Product product) {
//     _products.removeWhere((p) =>
//         p.name == product.name &&
//         p.imageUrl == product.imageUrl &&
//         p.price == product.price &&
//         // p.type == product.type &&
//         p.description == product.description );
//         // p.rating == product.rating);
//     notifyListeners();
//   }
// }