import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_form.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditPassword extends StatelessWidget {
  EditPassword({super.key});

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(73),
            Text('New Password', style: TextStyles.getSize30()),
            Gap(73),
            CustomTextField(
              controller: currentPasswordController,
              hintText: 'Current Password',
            ),
            Gap(26),
            CustomTextField(
              controller: newPasswordController,
              hintText: 'New Password',
            ),
            Gap(26),
            CustomTextField(
              isPassword: true,
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
            ),
            Gap(26),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: BottomAppBar(
          color: AppColors.white,
          child: MainButton(text: 'Update Password', onPressed: () {}),
        ),
      ),
    );
  }
}
