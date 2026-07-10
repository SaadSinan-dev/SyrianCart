class ProductModel {
  final String image;
  final String? description;
  final String name;
  final String type;
  final double price;
  final double rating;

  const ProductModel({
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.rating,
    this.description,
  });
}
