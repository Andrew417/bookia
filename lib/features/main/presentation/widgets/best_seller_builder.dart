import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/main/presentation/widgets/book_card_UI.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Best Seller', style: TextStyles.getSize24()),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all',
                style: TextStyles.getSize16(color: AppColors.primary),
              ),
            ),
          ],
        ),
        Gap(15),
        SizedBox(
          height: 280,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BookCardUI();
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
