import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product.dart';
import 'productprovider.dart';

class UpdatePage extends StatelessWidget {
  final Product product;

  const UpdatePage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: UpdateForm(product: product),
      ),
    );
  }
}

class UpdateForm extends StatefulWidget {
  final Product product;

  const UpdateForm({Key? key, required this.product}) : super(key: key);

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  late TextEditingController _nameController;
  late TextEditingController _typeController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _typeController = TextEditingController(text: widget.product.type);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
    _descriptionController =
        TextEditingController(text: widget.product.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _typeController,
          decoration: InputDecoration(labelText: 'Type'),
        ),
        TextField(
          controller: _priceController,
          decoration: InputDecoration(labelText: 'Price'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _descriptionController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Product updatedProduct = Product(
              name: _nameController.text,
              type: _typeController.text,
              price: double.parse(_priceController.text),
              description: _descriptionController.text,
              imagePath: widget.product.imagePath,
              rating: widget.product.rating,
            );

            Provider.of<ProductProvider>(context, listen: false)
                .updateProduct(updatedProduct);
            Navigator.of(context).pop();
          },
          child: Text('Update'),
        ),
      ],
    );
  }
}
