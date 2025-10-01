import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_form.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(text: 'Edit Profile'),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(54),

            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(AppImages.background),
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    padding: const EdgeInsets.all(
                      6,
                    ), // adjusted padding for balance
                    child: SvgPicture.asset(
                      AppImages.cameraSvg,
                      width: 22,
                      height: 22,
                    ),
                  ),
                ),
              ],
            ),

            Gap(54),
            CustomTextField(controller: nameController, hintText: 'Name'),
            Gap(12),
            CustomTextField(controller: phoneController, hintText: 'Phone'),
            Gap(12),
            CustomTextField(controller: addressController, hintText: 'Address'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: BottomAppBar(
          color: AppColors.white,
          child: MainButton(text: 'Update Profile', onPressed: () {}),
        ),
      ),
    );
  }
}
