import 'package:ecommerce2/features/home/data/models/brand_model.dart';
import 'package:ecommerce2/features/home/domain/entities/brand_entity.dart';

extension BrandMapper on BrandModel {
  BrandEntity toEntity() => BrandEntity(
    id: id,
    name: name ?? '',
    slug: slug ?? '',
    image: image ?? '',
  );
}
