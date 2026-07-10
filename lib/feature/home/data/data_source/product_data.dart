import 'package:syrian_cart/feature/home/data/models/product_models.dart';

class ProductData {
  static const List<ProductModel> products = [
    ProductModel(
      image: 'assets/images/product1.png',
      name: 'Modern Light Clothes',
      type: 'T-Shirt',
      price: 25.99,
      rating: 4.8,
      description:
          'A lightweight, breathable T-shirt crafted from premium cotton '
          'blend fabric. Its modern relaxed fit and soft texture make it '
          'perfect for everyday wear in any season.',
    ),
    ProductModel(
      image: 'assets/images/product2.png',
      name: 'Light Dress Bless',
      type: 'Dress modern',
      price: 89.99,
      rating: 4.5,
      description: 'An elegant modern dress featuring a flowing silhouette and '
          'delicate detailing. Designed to keep you comfortable while '
          'making a stylish statement for any occasion.',
    ),
    ProductModel(
      image: 'assets/images/product3.png',
      name: 'Winter Jacket',
      type: 'Jacket',
      price: 120.00,
      rating: 4.9,
      description: 'A warm, insulated winter jacket built to withstand cold '
          'weather without sacrificing style. Features a durable outer '
          'shell and a soft inner lining for maximum comfort.',
    ),
    ProductModel(
      image: 'assets/images/product4.png',
      name: 'Blue Jeans',
      type: 'Pants',
      price: 45.50,
      rating: 4.6,
      description:
          'Classic blue jeans with a comfortable regular fit and durable '
          'denim fabric. A timeless wardrobe staple that pairs well with '
          'nearly any outfit.',
    ),
  ];
}
