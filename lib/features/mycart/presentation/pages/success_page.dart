import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SuccessPageOrder extends StatelessWidget {
  const SuccessPageOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.successSvg,
                height: 145,
                fit: BoxFit.cover,
              ),
              Gap(35),
              Text('SUCCESS!', style: TextStyles.getSize30()),
              Gap(3),
              Text(
                'Your order will be delivered soon.',
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Text(
                'Thank you for choosing our app!',
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Gap(40),
              MainButton(
                text: "Back to Home",
                onPressed: () {
                  pushAndRemoveUntil(context, Routes.main);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
