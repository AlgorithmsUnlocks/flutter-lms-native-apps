import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String categories;
  final String imageUrl;
  final double price;
  final bool isRecomanded;
  final bool isPopular;
  final String rattings;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.isPopular,
    required this.isRecomanded,
    required this.price,
    required this.rattings,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        categories,
        isRecomanded,
        imageUrl,
        price,
        isPopular,
        rattings,
      ];
  static List<Product> product = [
    Product(
        name: "PTLLS - Level 3 Award in Education and Training",
        imageUrl: "https://trainingtale.org/wp-content/uploads/2021/08/PTLLS-Level-3-Award-in-Education-and-Training-1024x615.jpg",
        categories: "Education and Training",
        isPopular: false,
        isRecomanded: true,
        price: 250.0,
        rattings: "Five Star",
    ),
    Product(
      name: "PTLLS Training",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/08/PTLLS-Level-3-Award-in-Education-and-Training-1024x615.jpg",
      categories: "Education and Training",
      isPopular: true,
      isRecomanded: false,
      price: 25.0,
      rattings: "Five Star",
    ),
    Product(
      name: "PTLLS ",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/08/PTLLS-Level-3-Award-in-Education-and-Training-1024x615.jpg",
      categories: "Education and Training",
      isPopular: true,
      isRecomanded: false,
      price: 25.0,
      rattings: "Five Star",
    ),
    Product(
      name: "PTLLS - Level",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/08/PTLLS-Level-3-Award-in-Education-and-Training-1024x615.jpg",
      categories: "Education and Training",
      isPopular: true,
      isRecomanded: false,
      price: 25.0,
      rattings: "Five Star",
    ),
  ];
}
