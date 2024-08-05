E-Commerce App

This is a Flutter-based e-commerce application providing a platform for users to browse, search, and manage products. The app allows adding new products, updating existing ones, and deleting them using provider for state management.

Features
Product Listing: Display a list of available products with their images, names, prices, and descriptions.
Add Product: Add new products to the list with image upload functionality.
Update Product: Update details of existing products.
Delete Product: Remove products from the list.
Search Products: Search for products by name.
Provider State Management: Manage the state of the product list using the provider package.

Getting Started

Prerequisites
Flutter SDK
Dart SDK

Installation

Clone the repository:
git clone https://github.com/Fasikagebrehana/2024-internship-mobile-tasks.git

Install dependencies:
flutter pub get

Running the App
Run the app on an emulator or connected device:

flutter run
File Structure


lib/
├── main.dart               # Entry point of the app
├── add.dart                # Add product page
├── update.dart             # Update product page
├── search.dart             # Search functionality page
├── product.dart            # Product model
├── productprovider.dart    # Product provider for state management
├── cards.dart              # Widget for displaying product cards
└── img_picker.dart         # Image picker utility for adding product images


Dependencies

provider: State management
image_picker: Image selection from gallery or camera

Usage
Adding a Product
Click on the floating action button (+) on the home screen.
Fill in the product details and upload an image.
Click the 'Add' button to save the product.

Updating a Product
Tap on a product card to navigate to the details page.
Click the 'Update' button.
Modify the product details and save the changes.

Deleting a Product
Tap on a product card to navigate to the details page.
Click the 'Delete' button to remove the product from the list.

Searching for Products
Click on the search icon in the app bar.
Enter the product name in the search field to filter the product list.

Code Overview

main.dart
Entry point of the application.
Sets up ChangeNotifierProvider for the ProductProvider.
Defines the HomePage which displays the list of products.

add.dart
Defines the Add widget.
Provides a form to add new product details.
Uses ImagePicker to upload product images.
Adds the new product to ProductProvider.

update.dart
Defines the Update widget.
Provides a form to update existing product details.
Uses ImagePicker to change product images.
Updates the product in ProductProvider.

search.dart
Defines the Search widget.
Allows users to search for products by name.
Filters the product list based on the search query.

product.dart
Defines the Product model with fields for name, price, type, rating, image path, and description.

productprovider.dart
Manages the state of the product list.
Provides methods to add, update, and delete products.
Notifies listeners of state changes.

cards.dart
Defines the Cards widget.
Displays individual product details in a card format.

img_picker.dart
Utility class for image selection.
Provides methods to pick images from the gallery or camera.

![add](https://github.com/user-attachments/assets/45f5acf4-d3b1-429f-90b8-1ebdc9d1879f)
![search](https://github.com/user-attachments/assets/d705537c-3414-481f-a5f9-955883b8a62f)
![homepage](https://github.com/user-attachments/assets/29821ba4-a83e-43f5-af33-f7d07c427ca7)
![home](https://github.com/user-attachments/assets/df80ff0e-9f4d-4954-adc6-4ac62be6818b)
![detail](https://github.com/user-attachments/assets/42df0e63-5b24-4165-8a1d-1df0b42dab71)
