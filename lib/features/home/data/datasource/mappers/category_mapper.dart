import 'package:ecommerce2/features/home/data/models/category_model.dart';
import 'package:ecommerce2/features/home/domain/entities/category_entity.dart';

extension CategoryMapper on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
    id: id,
    name: name ?? '',
    slug: slug ?? '',
    image: image ?? '',
  );
}
