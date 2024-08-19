import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/addProduct.dart';
import '../bloc/bloc/add_bloc.dart';
import '../bloc/bloc/home_bloc.dart';
import 'home_page.dart';
// import 'productprovider.dart';
// import 'product.dart';
// import 'package:flutter/src/widgets/framework.dart'.

class ImgPicker {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  File? _image;
  final ImgPicker _imagePicker = ImgPicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  // final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Future<void> _pickImage() async {
    final File? imageFile = await _imagePicker.pickImageFromGallery();
    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }

  // final String name = _nameController.text;
  // final int? price = int.tryParse(_priceController.text);
  // final String category = _categoryController.text;
  // final String description = _descController.text;

  // if (name.isNotEmpty &&
  //     price != null &&
  //     category.isNotEmpty &&
  //     description.isNotEmpty &&
  //     _image != null) {

  //   final Product product = Product(
  //     name: name,
  //     price: price,
  //     imageUrl: _image!.path,
  //     description: description,
  //   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
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
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _image == null
                          ? Icon(
                              Icons.image_outlined,
                            )
                          : Image.file(
                              _image!,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                      SizedBox(height: 10),
                      Text("Upload your data"),
                    ],
                  ),
                ),
              ),
            ),
            _buildTextField("Name", _nameController),
            SizedBox(height: 40),
            // _buildTextField("Category", _categoryController),
            // SizedBox(height: 40),
            _buildTextField("Price", _priceController, isNumeric: true),
            SizedBox(height: 40),
            _buildTextField("Description", _descController, maxLines: 3),
            SizedBox(height: 30),
            Column(
              children: [

                BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is SubmittedState){

                          context.read<HomeBloc>().add(LoadAllProductEvent());
                    }

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        final String name = _nameController.text;
                        final int? price = int.tryParse(_priceController.text);
                        final String description = _descController.text;

                        if (name.isNotEmpty &&
                            price != null &&
                            description.isNotEmpty &&
                            _image != null) {
                          context.read<AddBloc>().add(AddProductEvent(
                                  product: Product(
                                id: "1",
                                name: name,
                                price: price,
                                imageUrl: _image!.path,
                                description: description,
                              )));

                          
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fill in all the fields')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Delete"),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      foregroundColor: Colors.red,
                      side: BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isNumeric = false, int maxLines = 1}) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(6),
            ),
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType:
                  isNumeric ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(border: InputBorder.none),
              autocorrect: true,
            ),
          ),
        ],
      ),
    );
  }
}

// extension on ImagePicker {
//   pickImageFromGallery() {}
// }

// extension on ImagePicker {
//   pickImageFromGallery() {}
// }
