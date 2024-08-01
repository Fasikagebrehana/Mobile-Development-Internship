import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

class Product {
  String? _name;
  String? _description;
  double? _price;

  void set setname(String? name) {
    _name = name;
  }

  void set setdescription(String? description) {
    _description = description;
  }

  void set setprice(double? price) {
    _price = price;
  }

  String? get getname {
    return _name;
  }

  String? get getdescription {
    return _description;
  }
}

class ProductManager {
  Product product = new Product();
  List<Product> products = [];

  void addProduct() {
    while (true) {
      print("Enter Product Name ");
      String? pName = stdin.readLineSync();
      if (pName != null && pName.isNotEmpty) {
        product._name = pName;
        break;
      } else {
        print("Product Name Cannot be Empty!");
      }
    }

    print("Enter Product Description ");
    String? pDescription = stdin.readLineSync();
    product._description = pDescription;

    while (true) {
      print("Enter Product Price ");
      String? p = stdin.readLineSync();
      double? pPrice = p != null ? double.tryParse(p) : null;
      if (pPrice != null) {
        product._price = pPrice;
        break;
      } else {
        print("Product Price Cannot be Empty!");
      }
    }

    products.add(product);
    print("Product added successfully");
  }

  void viewProducts() {
    if (products.isEmpty) {
      print("No products available");
    } else {
      print('___________________________');
      for (var i = 0; i < products.length; i++) {
        var product = products[i];
        print("Product ${i + 1}");
        print("Name : ${product._name}");
        print("Description : ${product._description}");
        print("Price : ${product._price}");
        print("__________________________");
      }
    }
  }

  void viewSingleProduct(int idx) {
    if (idx < 0 || idx >= products.length) {
      print("Invalid Index");
    } else {
      var product = products[idx];
      print("Product ${idx}");
      print("Name : ${product._name}");
      print("Description : ${product._description}");
      print("Price : ${product._price}");
    }
  }

  void editProduct(int idx) {
    if (idx < 0 || idx >= products.length) {
      print("Invalid Index");
    } else {
      var product = products[idx];

      while (true) {
        print("Enter New Product Name ");
        String? pName = stdin.readLineSync();
        if (pName != null && pName.isNotEmpty) {
          product._name = pName;
          break;
        } else {
          print("Product Name Cannot be Empty!");
        }
      }

      print("Enter New Product Description ");
      String? pDescription = stdin.readLineSync();
      product._description = pDescription;

      while (true) {
        print("Enter New Product Price ");
        String? p = stdin.readLineSync();
        double? pPrice = p != null ? double.tryParse(p) : null;
        if (pPrice != null) {
          product._price = pPrice;
          break;
        } else {
          print("Product Price Cannot be Empty!");
        }
      }
    }
  }

  void deleteProduct(int idx) {
    if (idx < 0 || idx >= products.length) {
      print("Invalid Index");
    } else {
      products.removeAt(idx);
      print("Deleted successfully!!");
    }
  }
}

void main() {
  print("WELLCOME TO SIMPLE ECOMMERCE SYSTEM");
  ProductManager productManager = new ProductManager();
  while (true) {
    print("Choose an option.");
    print("1. Add Product");
    print("2. View all Products");
    print("3. View Single Product");
    print("4. Edit Product");
    print("5. Delete Product");
    print("6. Exit");

    String? choice = stdin.readLineSync();
    if (choice == "1") {
      productManager.addProduct();
    } else if (choice == "2") {
      productManager.viewProducts();
    } else if (choice == "3") {
      print("Enter product index: ");
      int? index = int.tryParse(stdin.readLineSync() ?? '');
      if (index != null) {
        productManager.viewSingleProduct(index);
      } else {
        print('Invalid input.');
      }
    } else if (choice == "4") {
      print("Enter product index: ");
      int? index = int.tryParse(stdin.readLineSync() ?? '');
      if (index != null) {
        productManager.editProduct(index - 1);
      } else {
        print('Invalid input.');
      }
    } else if (choice == "5") {
      print("Enter product index: ");
      int? index = int.tryParse(stdin.readLineSync() ?? '');
      if (index != null) {
        productManager.deleteProduct(index - 1);
      } else {
        print('Invalid input.');
      }
    } else if (choice == "6") {
      return;
    } else {
      print("Invalid Input");
    }
  }
}
