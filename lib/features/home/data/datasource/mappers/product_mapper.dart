import 'package:ecommerce2/features/home/data/datasource/mappers/brand_mapper.dart';
import 'package:ecommerce2/features/home/data/datasource/mappers/category_mapper.dart';
import 'package:ecommerce2/core/models/product_model.dart';
import 'package:ecommerce2/features/home/domain/entities/brand_entity.dart';
import 'package:ecommerce2/features/home/domain/entities/category_entity.dart';
import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';

extension ProductMapper on ProductModel {
  ProductEntity toEntity() => ProductEntity(
    id: id,
    title: title ?? '',
    slug: slug ?? '',
    description: description ?? '',
    price: price ?? 0,
    brand: brand?.toEntity() ?? BrandEntity.empty(),
    category: category?.toEntity() ?? CategoryEntity.empty(),
    images: images ?? [],
    imageCover: imageCover ?? "",
    priceAfterDiscount: priceAfterDiscount ?? 0,
    quantity: quantity ?? 0,
    ratingsAverage: ratingsAverage ?? 0,
    isfavorite: false,
  );
}
