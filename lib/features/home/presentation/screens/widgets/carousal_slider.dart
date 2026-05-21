import 'package:ecommerce2/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousalslider extends StatefulWidget {
  const Carousalslider({super.key});

  @override
  State<Carousalslider> createState() => _CarousalsliderState();
}

class _CarousalsliderState extends State<Carousalslider> {
  final List<String> images = [
    Assets.images.coffe.path,
    Assets.images.dress.path,
    Assets.images.tshirt.path,
    Assets.images.children.path,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        height: 140.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                images[index],
                fit: BoxFit.fitHeight,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 145,
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: images.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 7,
                  activeDotColor: const Color.fromARGB(255, 55, 55, 55),
                  dotColor: const Color.fromARGB(255, 185, 184, 184),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
