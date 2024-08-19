import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/product.dart';
import '../bloc/bloc/update_bloc.dart';
import 'add.dart';
// import 'add.dart';

class UpdatePage extends StatefulWidget {
  final Product product;

  UpdatePage({Key? key, required this.product}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  File? _image;
  final ImgPicker _imagePicker = ImgPicker();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.product.name;
    _priceController.text = widget.product.price.toString();
    // _categoryController.text = widget.product.type;
    _descController.text = widget.product.description;
    _image = File(widget.product.imageUrl);
  }

  Future<void> _pickImage() async {
    final File? imageFile = await _imagePicker.pickImageFromGallery();
    if (imageFile != null) {
      setState(() {
        _image = imageFile;
      });
    }
  }

  void _updateProduct() {
    final String name = _nameController.text;
    final int? price = int.tryParse(_priceController.text);
    // final String category = _categoryController.text;
    final String description = _descController.text;

    if (name.isNotEmpty &&
        price != null &&
        // category.isNotEmpty &&
        description.isNotEmpty &&
        _image != null) {
      final Product updatedProduct = Product(
        id: "2",
        name: name,
        price: price,
        // type: category,
        // rating: widget.product.rating,
        imageUrl: _image!.path,
        description: description,
      );

      context.read<UpdateBloc>()
        ..add(UpdateProductEvent(
            product: Product(
          id: "1",
          name: name,
          price: price,
          imageUrl: _image!.path,
          description: description,
        )));
      Navigator.pop(context);
    }
  }

  // void _deleteProduct() {
  //   Provider.of<ProductProvider>(context, listen: false)
  //       .deleteProduct(widget.product);
  //   Navigator.pop(context);
  // }

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
                "Update Product",
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
            _buildTextField("Category", _categoryController),
            SizedBox(height: 40),
            _buildTextField("Price", _priceController, isNumeric: true),
            SizedBox(height: 40),
            _buildTextField("Description", _descController, maxLines: 3),
            SizedBox(height: 30),
            Column(
              children: [
                BlocListener<UpdateBloc, UpdateState>(
                  listener: (context, state) {
                    if (state is UpdateLoadedState) {
                      Navigator.pushNamed(context, '/');
                    }
                    // TODO: implement listener
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () => {
                        context.read<UpdateBloc>().add(UpdateProductEvent(
                                product: Product(
                              id: widget.product.id,
                              name: _nameController.text,
                              price: int.parse(_priceController.text),
                              imageUrl: _image!.path,
                              description: _descController.text,
                            )))
                      },
                      child: Text("Update"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: OutlinedButton(
                    // onPressed:
                    onPressed: () => {},
                    child: Text("Delete"),
                    style: OutlinedButton.styleFrom(
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
