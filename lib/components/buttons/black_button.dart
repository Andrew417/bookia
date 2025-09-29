import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.style,
    required this.onPressed,
    this.borderRadius,
  });

  final String text;
  final double? height;
  final double? width;
  final double? borderRadius;
  final TextStyle? style;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      width: width ?? 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(borderRadius ?? 5),
          ),
          padding: const EdgeInsets.all(0),
        ),

        child: Text(
          text,
          style: style ?? TextStyles.getSize16(color: AppColors.white),
        ),
      ),
    );
  }
}
