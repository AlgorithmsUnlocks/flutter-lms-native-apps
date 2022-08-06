import 'package:equatable/equatable.dart';

class Reviews extends Equatable {
  final String name;
  final String imageUrl;
  final String content;

  const Reviews({
    required this.name,
    required this.imageUrl,
    required this.content,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl, content];

  static List<Reviews> reviews = [
    Reviews(
      name: "Jayden Hawkins",
      imageUrl:
          "https://trainingtale.org/wp-content/uploads/2021/12/Jayden-Hawkins.jpg",
      content:
          "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),
    Reviews(
      name: "Michael Harper",
      imageUrl:
      "https://trainingtale.org/wp-content/uploads/2021/12/Michael-Harper.jpg",
      content:
      "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),
    Reviews(
      name: "Adam Potts",
      imageUrl:
      "https://trainingtale.org/wp-content/uploads/2021/12/Adam-Potts.jpg",
      content:
      "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),
    Reviews(
      name: "Lily Stone",
      imageUrl:
      "https://trainingtale.org/wp-content/uploads/2021/12/Lily-Stone.jpg",
      content:
      "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),
    Reviews(
      name: "Louise Buckley",
      imageUrl:
      "https://trainingtale.org/wp-content/uploads/2021/12/Louise-Buckley.jpg",
      content:
      "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),
    Reviews(
      name: "Amelia Barnett",
      imageUrl:
      "https://trainingtale.org/wp-content/uploads/2021/12/Amelia-Barnett.jpg",
      content:
      "I am impressed with their service! While doing the course, I have faced some issues, and I contacted "
          "customer support instantly. They have listened to my problem in a friendly yet professional manner and sorted the problem quickly. Highly recommended.",
    ),

  ];
}
