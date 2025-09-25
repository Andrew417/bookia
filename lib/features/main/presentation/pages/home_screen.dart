import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/main/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(AppImages.logoSvg, height: 30),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.searchSvg),
          ),
        ],
      ),
      body: Padding(padding: const EdgeInsets.all(12), child: HomeSlider()),
    );
  }
}
