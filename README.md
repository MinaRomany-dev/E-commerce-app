# Elite Shop 🛍️

A Flutter e-commerce application that allows users to browse products, manage their cart, add products to favorites, and complete checkout operations.

## Overview

Elite Shop is a shopping application built with Flutter.  
The application provides users with product browsing, product details, authentication features, cart management, favorites management, and checkout functionality.

## Features

### Authentication
- User login.
- User registration.
- Forget password.
- Verify reset code.
- Reset password.
- Token storage and verification.

### Products
- Display product details.
- Show product images.
- Show product description.
- Display product rating.
- Add products to cart.

### Cart
- Get cart data.
- Add product to cart.
- Update product quantity.
- Remove product from cart.
- Clear cart.

### Favorites
- Get favorite products.
- Add products to favorites.
- Remove products from favorites.

### Checkout
- Create checkout request.

### Profile
- Display user profile information.
- Pick profile image from camera.
- Pick profile image from gallery.
- Logout.

## Screens

- Splash Screen.
- Login Screen.
- Product Details Screen.
- Profile Screen.

## Technologies Used

- Flutter
- Dart
- Flutter Bloc
- Dio
- Sqflite
- Flutter Secure Storage
- Injectable
- Get It

## Packages

Main packages used:

- `dio` - API requests.
- `pretty_dio_logger` - Logging network requests.
- `flutter_bloc` - State management.
- `sqflite` - Local database.
- `flutter_secure_storage` - Secure token storage.
- `injectable` - Dependency injection.
- `get_it` - Service locator.
- `cached_network_image` - Network image caching.
- `carousel_slider` - Product image slider.
- `image_picker` - Pick images from camera and gallery.
- `permission_handler` - Handle permissions.
- `lottie` - Display animations.
- `webview_flutter` - WebView support.

## API Handling

The application uses Dio for handling API requests with:

- GET requests.
- POST requests.
- PUT requests.
- DELETE requests.

It also includes:
- Request timeout handling.
- Token attachment using Dio interceptor.
- Error handling for different response status codes.

## Local Storage

The application uses:

### Flutter Secure Storage
Used for storing and retrieving authentication token.

### Sqflite Database
Used for local product storage with a `products` table.

Stored product data includes:

- id
- title
- description
- price
- imageCover
- images
- categoryName
- ratingsAverage
- ratingsQuantity
- priceAfterDiscount

## Project Dependencies

The project uses:

- Flutter SDK
- Dart SDK ^3.9.2

## Assets

The project includes:

- Images assets.
- SVG assets.
- Lottie animation assets.

## Installation

1. Clone the repository.

```bash
git clone <repository-url>