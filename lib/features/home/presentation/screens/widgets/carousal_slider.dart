import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousalslider extends StatefulWidget {
  final List<String> images;

  const Carousalslider({super.key, required this.images});

  @override
  State<Carousalslider> createState() => _CarousalsliderState();
}

class _CarousalsliderState extends State<Carousalslider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellowAccent,
      child: SizedBox(
        height: 0.50.sh,
        child: CarouselSlider.builder(
          itemCount: widget.images.length,
          options: CarouselOptions(
            aspectRatio: 1,
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
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.images[index],

                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 145,
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: widget.images.length,
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
        ),
      ),
    );
  }
}
