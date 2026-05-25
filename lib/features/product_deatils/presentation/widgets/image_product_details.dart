import 'package:ecommerce2/features/home/domain/entities/product_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProductDetails extends StatelessWidget {
  final ProductEntity product;
  const ImageProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.50.sh,

      child: PageView.builder(
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),

              child: Image.network(
                product.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
