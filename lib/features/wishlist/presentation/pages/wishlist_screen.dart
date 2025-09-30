import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.background,
                      height: 118,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'book name',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.getSize18(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.highlight_remove_outlined,
                                color: AppColors.dark,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.getSize16(),
                        ),
                        Gap(21),

                        Row(
                          children: [
                            Spacer(),
                            MainButton(
                              height: 40,
                              width: 180,
                              borderRadius: 4,
                              text: 'Add To Cart',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
