class Subcategory {
  String id;
  String? name;
  String? slug;
  String? categoryId;
  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.categoryId,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json["_id"],
      name: json["name"] as String?,
      slug: json["slug"] as String?,
      categoryId: json["categoryId"] as String?,
    );
  }
}
