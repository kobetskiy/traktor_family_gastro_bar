import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.width = 300,
    this.height = 70,
  }) : isOutlined = false;

  const PrimaryButton.outlined({
    super.key,
    required this.child,
    this.onPressed,
    this.width = 300,
    this.height = 70,
  }) : isOutlined = true;

  final Widget? child;
  final void Function()? onPressed;
  final double width;
  final double height;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

    ButtonStyle style = OutlinedButton.styleFrom(
      padding: padding,
      backgroundColor: !isOutlined ? AppColors.primaryColor : null,
      disabledBackgroundColor: !isOutlined ? Colors.grey[800] : null,
      foregroundColor:
          !isOutlined ? AppColors.backgroundColor : AppColors.titleColor,
      disabledForegroundColor: !isOutlined ? Colors.white : Colors.grey[600],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    );

    return SizedBox(
      width: width,
      height: height,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: child)
          : ElevatedButton(onPressed: onPressed, style: style, child: child),
    );
  }
}
