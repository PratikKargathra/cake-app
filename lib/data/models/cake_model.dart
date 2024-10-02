import 'dart:math';

class Cake {
  final String id;
  final String image;
  final String name;
  final String recipe;
  final String description;
  final String size;
  final bool isFavourite;

  Cake({
    String? cakeId,
    required this.image,
    required this.name,
    required this.recipe,
    required this.description,
    required this.size,
    required this.isFavourite,
  }) : id = cakeId ?? generateUniqueCakeID();

  static String generateUniqueCakeID() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return String.fromCharCodes(
      List.generate(
        16,
        (index) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  factory Cake.fromJson(Map<String, dynamic> json) => Cake(
        cakeId: json['id'] as String,
        name: json["name"] as String,
        description: json["description"] as String,
        image: json["image"] as String,
        isFavourite: (json["isFavourite"] as int) == 1,
        recipe: json["recipe"] as String,
        size: json["size"] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'isFavourite': isFavourite ? 1 : 0,
        'recipe': recipe,
        'size': size,
      };
}

class CakeSize {
  static const g100 = "100g";
  static const g250 = "250g";
  static const g500 = "500g";
  static const g750 = "750g";
  static const kg1 = "1kg";
  static const g1500 = "1.5kg";
  static const kg2 = "2kg";
  static const kg3 = "3kg";
  static const kg4 = "4kg";
  static const kg5 = "5kg";
  static const kg6 = "6kg";
  static const kg7 = "7kg";
  static const kg8 = "8kg";
  static const kg9 = "9kg";
  static const kg10 = "10kg";
  static const kg15 = "15kg";
  static const kg20 = "20kg";

  static const all = [
    g100,
    g250,
    g500,
    g750,
    kg1,
    g1500,
    kg2,
    kg3,
    kg4,
    kg5,
    kg6,
    kg7,
    kg8,
    kg9,
    kg10,
    kg15,
    kg20,
  ];
}
