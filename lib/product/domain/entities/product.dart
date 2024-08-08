import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String id;
  final String name;
  final int price;
  final String imagePath;
  final String description;

Product ({
  required this.id,
  required this.name,
  required this.price,
  required this.imagePath,
  required this.description,
});

  @override
  List<Object?> get props => [id, name, price, imagePath, description];

}