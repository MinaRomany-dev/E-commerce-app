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

  Map<String, dynamic> toMap() {
    return {'_id': id, 'name': name, 'slug': slug, 'image': image};
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
      image: map['image'],
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'],
    );
  }
}
