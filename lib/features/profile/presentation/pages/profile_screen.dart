import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<String> profileList = [
    'My Orders',
    'Edit Profile',
    'Reset Password',
    'FAQ',
    'Contact Us',
    'Privacy & Terms',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: AppColors.dark,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.background),
                ),
                const Gap(13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Profile Name', style: TextStyles.getSize20()),
                    const Gap(6),
                    const Text(
                      'andrewehab417@gmail.com',
                      style: TextStyle(fontSize: 14, color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(35),

          Column(
            children: List.generate(profileList.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    profileList[index],
                    style: TextStyles.getSize18(color: AppColors.darkGrey),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    switch (index) {
                      case 1:
                        pushTo(context, Routes.editProfile);
                        break;
                      case 2:
                        pushTo(context, Routes.editPassword);
                        break;
                      default:
                    }
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
