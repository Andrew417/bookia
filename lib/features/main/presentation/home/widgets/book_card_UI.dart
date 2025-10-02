import 'package:bookia/components/buttons/black_button.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/main/data/models/book_product_response/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCardUI extends StatelessWidget {
  const BookCardUI({super.key, required this.product, required this.source});

  final Product product;
  final String source;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.bookDescription);
      },
      child: Container(
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
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Gap(5),
            SizedBox(
              height: 45,
              child: Text(
                product.name ?? '',
                style: TextStyles.getSize16(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${product.price ?? ''}", style: TextStyles.getSize18()),

                Spacer(),
                SizedBox(
                  child: BlackButton(text: 'Buy', onPressed: () {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
