// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/aboutproduct.dart';
import 'main.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                width: 120,
              ),
              Text(
                "Search Product",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.height * 0.05,
                  // margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.blue,
                              ),
                              labelText: "    Leather",
                              border: InputBorder.none),
                          autocorrect: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7.0)),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: const AboutProduct());
                          });
                    },
                    icon: Icon(Icons.filter_list),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Card(
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, top: 10.0),
                              child: Text(
                                "  Derby Leather Shoes",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
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
                Card(
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, top: 10.0),
                              child: Text(
                                "  Derby Leather Shoes",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
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
                Card(
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, top: 10.0),
                              child: Text(
                                "  Derby Leather Shoes",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
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
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({Key? key}) : super(key: key);

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues values = const RangeValues(0.1, 0.5);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return Center(
      child: RangeSlider(
        values: values,
        divisions: 10,
        labels: labels,
        onChanged: (newValues) {
          setState(() {
            values = newValues;
          });
        },
      ),
    );
  }
}
