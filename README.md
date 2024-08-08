# ecommerce

Overview
The eCommerce app is built using Clean Architecture principles to ensure a scalable, maintainable, and testable codebase. This document provides an overview of the project structure, including folder organization, and explains the implementation of models and use cases.

Project Structure
```
Folder Organization
lib/
├── core/
│   ├── failure/                  # Error handling and failure classes
│   ├── network/                # Network-related utilities and error handling
│   └── usecases/               # Abstract use case classes
│
├── product/
│       ├── data/               # Data layer implementation
│       │   ├── datasources/    # Data source definitions (e.g., remote/local)
│       │   ├── models/         # Data models
│       │   ├── repositories/   # Repository implementations
│       │   └── product_repository_impl.dart
│       ├── domain/             # Domain layer definitions
│       │   ├── entities/       # Domain entities
│       │   ├── repositories/   # Repository interfaces
│       │   └── usecases/       # Use case classes
│       └── presentation/       # Presentation layer
│           ├── blocs/          # Business Logic Components (BLoCs)
│           ├── pages/          # UI pages
│           └── widgets/        # UI widgets
│
└── main.dart                    # Entry point of the application

```
Core Layer

core/failure/: Contains error handling and failure classes used throughout the app.
core/network/: Includes utilities for network operations and error handling.
core/usecases/: Abstract classes for use cases, defining the contract for business logic operations.

Features Module
features/product/: Contains the implementation specific to the product feature.

data/: Implements data-related functionality.

datasources/: Defines data sources (e.g., API, local database).
models/: Data models that map to entities and handle JSON conversion.
repositories/: Implements repository interfaces.
product_repository_impl.dart: Contains the implementation of repository methods.
domain/: Contains business logic and abstractions.

entities/: Defines domain entities.
repositories/: Interfaces for repositories, defining methods for data access.
usecases/: Contains use cases implementing business logic.
presentation/: Manages the user interface.


pages/: UI pages.
widgets/: Reusable UI widgets.

Implementation Details

Step 1: Implement Models

ProductModel
The ProductModel class is located in lib/product/data/models/product_model.dart and is used to represent product data with JSON serialization.

Unit Tests for ProductModel
Unit tests are located in test/product/data/models/product_model_test.dart and ensure the correctness of the ProductModel class.

Step 2: Implement Use Cases

Domain Layer Use Cases
Use cases are defined in lib/product/domain/usecases/ and encapsulate business logic.

Data Layer Repository Implementation
The repository implementation is in lib/product/data/repositories/product_repository_impl.dart.

Testing
Unit tests for use cases and repositories ensure that the application logic is correctly implemented.

Repository Tests
