import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/product.dart';
import 'package:practice/search.dart';
import 'add.dart';
import 'cards.dart';
import 'details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Add()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        title: Row(children: [
          Image.asset(
            'images/image.png',
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
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
                    color: Colors.grey.shade500),
              ),

              Row(
                children: [
                  Text("Hello, ",
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w400)),
                  Text("Fasika",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              )

              // fontWeight: FontWeight.w100,
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10.0)),
            child: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          )
        ]),
      ),
      body: ListView(
        padding: EdgeInsets.all(18.0),
        children: [
          Container(
            // margin: EdgeInsets.only(left: 5, right: 5),
            child: ListTile(
              title: Text(
                "Available Products",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    borderRadius: BorderRadius.circular(10.0)),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()))
                  },
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Container(
                    // borderRadius: BorderRadius.circular(10),
                    child: Cards(
                        product: Product(
                            imagePath: "images/shoes.jpg",
                            name: "Derby Leather",
                            price: 120.0,
                            type: "Men's shoe",
                            rating: 3.5,
                            description:
                                "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe."))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                  // borderRadius: BorderRadius.circular(10),
                  child: Cards(
                      product: Product(
                          imagePath: "images/vans.jpg",
                          name: "Vans Off the wall",
                          price: 259.0,
                          type: "Women's and Men's shoe",
                          rating: 4.5,
                          description:
                              "Vans shoes have been an iconic symbol of youthful energy, creativity, and individuality since their inception in 1966. Founded by Paul Van Doren, the brand quickly became a staple in the skateboarding community and has since evolved into a global phenomenon. Vans shoes are renowned for their simple yet versatile design. The classic styles, such as the Authentic, Era, Old Skool, and Sk8-Hi, feature a minimalist silhouette with a low-top or high-top profile."))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                  // borderRadius: BorderRadius.circular(10),
                  child: Cards(
                      product: Product(
                          imagePath: "images/converse.jpg",
                          name: "All star converse",
                          price: 300.0,
                          type: "Women's shoe",
                          rating: 5,
                          description:
                              "The Converse All Star, also known as Chuck Taylor All Stars or simply Chucks has stood the test of time as one of the most iconic and enduring shoes in history. First introduced in 1917, these sneakers have transcended their original purpose as basketball shoes to become a global symbol of style and individuality. Converse All Stars are instantly recognizable by their distinct high-top or low-top silhouette, rubber toe cap, and vulcanized rubber sole."))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                  // borderRadius: BorderRadius.circular(10),
                  child: Cards(
                      product: Product(
                          imagePath: "images/nike.jpg",
                          name: "Nike Snickers",
                          price: 200.0,
                          type: "Women's shoe",
                          rating: 3.5,
                          description:
                              "Nike sneakers have become synonymous with cutting-edge athletic performance and trendsetting style since the brand's founding in 1964. Known for their innovative designs, advanced technology, and iconic swoosh logo, Nike has revolutionized the footwear industry. From the groundbreaking Air cushioning system to the Flyknit material, Nike continually pushes the boundaries of what athletic footwear can achieve. These sneakers cater to a wide range of sports, including running, basketball, soccer, and more, while also becoming a staple in streetwear fashion. Celebrities, athletes, and everyday consumers alike flock to Nike for shoes that not only enhance performance but also make a bold fashion statement."))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                  // borderRadius: BorderRadius.circular(10),
                  child: Cards(
                      product: Product(
                          imagePath: "images/jordan.jpg",
                          name: "Nike",
                          price: 23000,
                          type: "Men's shoe",
                          rating: 3.5,
                          description:
                              "Air Jordan sneakers, launched in 1984 in collaboration with basketball icon Michael Jordan, have transcended their athletic roots to become a global cultural phenomenon. Originally designed to provide exceptional performance on the basketball court, Air Jordans feature cutting-edge technology and innovative design elements, such as the revolutionary Air cushioning system, ensuring optimal comfort and support for athletes. The iconic silhouette, bold colorways, and distinctive Jumpman logo have made Air Jordans a coveted item in both sports and fashion circles. "))),
            ),
          ),
        ],
      ),
    );
  }
}
