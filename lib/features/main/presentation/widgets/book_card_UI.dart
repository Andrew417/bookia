import 'package:bookia/components/buttons/black_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCardUI extends StatelessWidget {
  const BookCardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(
                AppImages.background,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Gap(5),
          SizedBox(
            height: 42,
            child: Text(
              'Book Name',
              style: TextStyles.getSize16(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextStyles.getSize18()),

              Spacer(),
              SizedBox(
                child: BlackButton(text: 'Buy', onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
