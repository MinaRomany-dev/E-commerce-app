// class CategoryModel {
//   String id;
//   String? name;
//   String? slug;
//   String? image;

//   CategoryModel({required this.id, this.name, this.slug, this.image});

//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//     id: json['_id'] as String,
//     name: json['name'] as String?,
//     slug: json['slug'] as String?,
//     image: json['image'] as String?,
//   );


// }
// data/models/category_model.dart
class CategoryModel {
  final String id;
  final String? name;
  final String? slug;
  final String? image;

  CategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'],
    );
  }
}