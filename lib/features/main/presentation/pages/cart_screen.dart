import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart'), centerTitle: true),
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
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.buttonAdd,

                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(Icons.add),
                              ),
                            ),
                            Gap(15),
                            Text(
                              '01',
                              style: TextStyles.getSize18(
                                fontFamily: AppFonts.nunitoSans,
                                color: AppColors.dark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(15),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.buttonAdd,

                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(Icons.remove),
                              ),
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
      bottomNavigationBar: _checkoutBottomSheet(context),
    );
  }

  Container _checkoutBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyles.getSize24(
                      color: AppColors.grey,
                      fontFamily: AppFonts.nunitoSansBold,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "\$150.00",
                    style: TextStyles.getSize24(
                      fontFamily: AppFonts.nunitoSansBold,
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Gap(19),

            MainButton(
              text: "Checkout ",
              onPressed: () {
                pushTo(context, Routes.orderScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
