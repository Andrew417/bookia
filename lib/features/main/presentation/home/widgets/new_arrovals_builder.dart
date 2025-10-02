import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/main/data/models/book_product_response/product.dart';
import 'package:bookia/features/main/presentation/home/widgets/book_card_UI.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewArrivalsBuilder extends StatelessWidget {
  const NewArrivalsBuilder({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('New Arrivals', style: TextStyles.getSize24()),
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
          height: 290,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return BookCardUI(product: products[index], source: 'new');
            },
            separatorBuilder: (context, index) {
              return Gap(10);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
