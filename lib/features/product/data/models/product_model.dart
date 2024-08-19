import 'package:flutter/foundation.dart';

import '../../domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel ({
    required String id,
    required String name,
    required int price,
    required String imageUrl,
    required String description,
}) : super(id: id, name: name, description: description, price: price, imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    price: json['price'] is int ? json['price'] :int.tryParse(json['price'].toString()) ?? 0,
    imageUrl: json['imageUrl'] ?? '',
);

Map<String, dynamic> toJson() => {
  "name" : name,
  "description" : description,
  "price": price,
};

Product toEntity() => Product(
  id: id,
  name: name,
  description: description,
  price: price,
  imageUrl: imageUrl,
);

factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
    );
  }

}
