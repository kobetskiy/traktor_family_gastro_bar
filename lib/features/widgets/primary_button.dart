import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.contentPadding,
    this.backgroundColor,
  }) : isOutlined = false;

  const PrimaryButton.outlined({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.contentPadding,
    this.backgroundColor,
  }) : isOutlined = true;

  final Widget? child;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final bool isOutlined;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = OutlinedButton.styleFrom(
      padding: contentPadding ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textStyle: Theme.of(context).textTheme.titleSmall,
      backgroundColor: !isOutlined
          ? backgroundColor ?? Theme.of(context).primaryColor
          : null,
      disabledBackgroundColor: !isOutlined ? Colors.grey[800] : null,
      foregroundColor:
          !isOutlined || Theme.of(context).brightness == Brightness.light
              ? Colors.black87
              : Colors.white,
      disabledForegroundColor: !isOutlined ? Colors.white : Colors.grey[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
    );

    return SizedBox(
      height: height ?? 60,
      width: width ?? MediaQuery.sizeOf(context).width,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: child)
          : ElevatedButton(onPressed: onPressed, style: style, child: child),
    );
  }
}
