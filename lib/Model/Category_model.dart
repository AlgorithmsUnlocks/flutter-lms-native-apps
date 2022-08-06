import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageUrl;

  const Category({
   required this.name,
   required this.imageUrl,
});

  @override
  // TODO: implement props
  List<Object?> get props => [name,imageUrl];

  static List<Category> categories=[

    Category(
        name: "Level 1 Health and Safety in a Construction Environment",
        imageUrl: "https://firebasestorage.googleapis.com/v0/b/trainng-tale-lms.appspot.com/o/Level-1-Health-and-Safety-in-a-Construction-Environment.jpg?alt=media&token=7be506e8-71a3-40e9-a6d8-14450b80939b" ,
    ),
    Category(
      name: "Level 3 Award in Education & Training (AET) Course",
      imageUrl: "https://firebasestorage.googleapis.com/v0/b/trainng-tale-lms.appspot.com/o/Level-3-Award-in-Education-Training-AET-Course.jpg?alt=media&token=75493b0c-ba55-470a-9853-f777b8ac0bc5" ,
    ),
    Category(
      name: "PTLLS - Level 3 Award in Education and Training",
      imageUrl: "https://firebasestorage.googleapis.com/v0/b/trainng-tale-lms.appspot.com/o/PTLLS-Level-3-Award-in-Education-and-Training.jpg?alt=media&token=d5acb398-6764-40fe-8618-9ae8b76d4844" ,
    ),
    Category(
      name: "Property Management",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/04/Property-Management-1.jpg" ,
    ),
    Category(
      name: "Workplace First Aid Training",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/04/Workplace-First-Aid-Training-1.jpg" ,
    ),
    Category(
      name: "Level 7 Construction Management Course",
      imageUrl: "https://trainingtale.org/wp-content/uploads/2021/04/Level-7-Construction-Management-Course.jpg" ,
    ),

  ];

}