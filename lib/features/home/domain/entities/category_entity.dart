class CategoryEntity {
  final String id;
  final String name;
  final String slug;
  final String? image;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.image,
  });

  factory CategoryEntity.empty() => CategoryEntity(
        id: '',
        name: '',
        slug: '',
        image: null,
      );
}