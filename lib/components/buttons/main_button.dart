import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 55,
    required this.onPressed,
    this.bgColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderColor,
    this.borderRadius,
  });
  final String text;
  final double width;
  final double height;
  final double? borderRadius;
  final Function() onPressed;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.getSize18(color: textColor)),
      ),
    );
  }
}
