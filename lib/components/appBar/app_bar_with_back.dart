import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithBack({super.key, this.actionWidget, this.text});

  final Widget? actionWidget;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: GestureDetector(
                onTap: () => pop(context),
                child: Image.asset(AppImages.back, width: 41, height: 41),
              ),
            ),
          ),

          if (text != null)
            Align(
              alignment: Alignment.center,
              child: Text(
                text!,
                style: TextStyles.getSize24(),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
