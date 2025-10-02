import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/main/data/models/book_product_response/product.dart';
import 'package:bookia/features/main/presentation/home/widgets/book_card_UI.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('All Products', style: TextStyles.getSize24()),
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
        GridView.builder(
          shrinkWrap: true,

          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 290,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: BookCardUI(product: products[index], source: 'new'),
              onTap: () {
                pushTo(context, Routes.bookDescription);
              },
            );
          },
          itemCount: products.length,
        ),
      ],
    );
  }
}
