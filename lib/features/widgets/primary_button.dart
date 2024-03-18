import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar/core/ui/colors.dart';

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
    ButtonStyle style = ButtonStyle(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      foregroundColor: MaterialStatePropertyAll(AppColors.titleColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
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
