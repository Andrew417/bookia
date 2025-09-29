import 'package:bookia/components/buttons/black_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookDescriptionScreen extends StatelessWidget {
  const BookDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.back, width: 41, height: 41),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppImages.wishlistSvg),
              ),
            ],
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: 200,
                    // color: AppColors.border,
                    child: Image.asset(AppImages.background, fit: BoxFit.cover),
                  ),
                  Gap(10),
                  Text(
                    'Black Heart',
                    style: TextStyles.getSize26(fontSize: 30),
                  ),
                  Gap(5),
                  Text(
                    'Broche',
                    style: TextStyles.getSize16(color: AppColors.primary),
                  ),
                ],
              ),
            ),

            Text('Desciprition', style: TextStyles.getSize18()),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$Price', style: TextStyles.getSize24()),
              Gap(40),
              Expanded(
                child: BlackButton(
                  height: 55,
                  width: 30,
                  // borderRadius: 8,
                  // bgColor: AppColors.darkColor,
                  text: 'Add to Cart',
                  style: TextStyles.getSize18(color: AppColors.white),
                  onPressed: () {},
                  // onPressed: () {
                  // cubit.addToCart(product.id ?? 0);
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
