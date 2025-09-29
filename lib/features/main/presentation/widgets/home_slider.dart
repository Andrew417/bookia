import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_sliderBuilder(), Gap(14), _pageIndicatorBuilder()],
    );
  }

  SmoothPageIndicator _pageIndicatorBuilder() {
    return SmoothPageIndicator(
      controller: PageController(initialPage: _currentIndex),
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.primary,
        dotHeight: 7,
        dotWidth: 7,
        spacing: 4,
        expansionFactor: 5,
        dotColor: AppColors.border,
      ),
      onDotClicked: (index) {},
    );
  }

  CarouselSlider _sliderBuilder() {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.asset(
              AppImages.background,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
      options: CarouselOptions(
        height: 150,
        aspectRatio: 1,
        initialPage: 0,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlay: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
