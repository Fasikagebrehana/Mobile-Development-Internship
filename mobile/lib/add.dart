import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
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
                "Add Product",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      // border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                      ),
                      SizedBox(height: 10),
                      Text("Upload your data")
                    ],
                  )),
                )),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Name"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(border: InputBorder.none),
                      autocorrect: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Category"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(border: InputBorder.none),
                      autocorrect: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Price"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(border: InputBorder.none),
                      autocorrect: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Description"),
                  Container(
                    // height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(6)),
                    child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(border: InputBorder.none),
                      autocorrect: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text(
                      "Add",
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text("Delete"),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.red,
                        side: BorderSide(color: Colors.red),
                        padding: EdgeInsets.symmetric(vertical: 16)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
