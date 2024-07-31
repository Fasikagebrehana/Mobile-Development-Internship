import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     foregroundColor: Colors.black,
      //     backgroundColor: Colors.white,
      //   ),
      // ),

      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Sora',
                      fontSize: 10,
                      color: Colors.black),
                ),
                const Text(
                  "Hello, Yohannes",
                  style: TextStyle(
                    color: Colors.black,
                    // fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10.0)),
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            )
          ]),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            ListTile(
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
                child: Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
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
                        'images/Rectangle 27.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(10.0)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Derby Leather Shoes",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$120  ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ]),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "    Men's Shoe",
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
                              "(4.0)  ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300),
                            ),
                          ])
                        ]),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
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
                        'images/Rectangle 27.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(10.0)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Derby Leather Shoes",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$120  ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ]),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "    Men's Shoe",
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
                              "(4.0)  ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300),
                            ),
                          ])
                        ]),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
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
                        'images/Rectangle 27.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(10.0)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Derby Leather Shoes",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$120  ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ]),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "    Men's Shoe",
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
                              "(4.0)  ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300),
                            ),
                          ])
                        ]),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
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
                        'images/Rectangle 27.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Padding(padding: EdgeInsets.all(10.0)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Derby Leather Shoes",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$120  ",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ]),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "    Men's Shoe",
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
                              "(4.0)  ",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300),
                            ),
                          ])
                        ]),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
