import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_form.dart';
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/mycart/presentation/pages/gov_bottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: _orderBody(),
      bottomNavigationBar: _submitOrderBottomSheet(context),
    );
  }

  Container _submitOrderBottomSheet(BuildContext context) {
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
              text: "Submit Order ",
              borderRadius: 8,
              onPressed: () {
                pushTo(context, Routes.sucessOrder);
              },
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();

  Padding _orderBody() {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Form(
          // key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Place Your Order', style: TextStyles.getSize30()),
              Gap(10),
              Text(
                "Don't worry! It occurs. Please enter the email address linked with your account.",
                style: TextStyles.getSize16(color: AppColors.grey),
              ),
              Gap(30),
              CustomTextField(
                controller: name,
                hintText: 'Full Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              Gap(20),

              CustomTextField(
                controller: email,
                hintText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              Gap(20),
              CustomTextField(
                controller: address,
                hintText: 'address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              Gap(20),
              CustomTextField(
                controller: phone,
                hintText: 'phone',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
              ),
              Gap(20),
              GovBottomsheet(),

              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
