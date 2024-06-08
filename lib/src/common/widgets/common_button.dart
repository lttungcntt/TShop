import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import 'material_ink_well.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.border = 1.0,
    this.textStyle,
    this.isLoading = false,
  });

  final String title;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final double border;
  final IconData? icon;
  final TextStyle? textStyle;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final opacity = isLoading ? 0.3 : 1.0;
    return MaterialInkWell(
      onTap: () => isLoading ? null : onPressed?.call(),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: (backgroundColor ?? context.colorTheme.primaryContainer)
                .withOpacity(opacity),
            border: Border.all(
              color: borderColor ?? context.colorTheme.primaryText,
              width: border,
            ),
            borderRadius: BorderRadius.circular(border),
          ),
          child: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                      child: CircularProgressIndicator(strokeWidth: 5.0)))
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        Icon(icon,
                            color: (color ?? context.colorTheme.primaryText)
                                .withOpacity(opacity)),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        title,
                        style: textStyle ??
                            context.textTheme.medium.copyWith(
                                color: color ?? context.colorTheme.primaryText),
                      ),
                    ],
                  ),
                ))),
    );
  }
}
