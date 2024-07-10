import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
  }) : isOutlined = false;

  const PrimaryButton.outlined({
    super.key,
    required this.child,
    this.onPressed,
    this.width,
    this.height,
  }) : isOutlined = true;

  final Widget? child;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textStyle: Theme.of(context).textTheme.titleSmall,
      backgroundColor: !isOutlined ? Theme.of(context).primaryColor : null,
      disabledBackgroundColor: !isOutlined ? Colors.grey[800] : null,
      foregroundColor:
          !isOutlined || Theme.of(context).brightness == Brightness.light
              ? Colors.black87
              : Colors.white,
      disabledForegroundColor: !isOutlined ? Colors.white : Colors.grey[600],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    );

    return SizedBox(
      width: width ?? 300,
      height: height ?? 60,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: child)
          : ElevatedButton(onPressed: onPressed, style: style, child: child),
    );
  }
}
