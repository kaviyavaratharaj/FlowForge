import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/radius.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/text_style.dart';

enum ButtonSize {
  small,
  medium,
  large,
}

class PrimaryButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final bool isLoading;

  final bool isEnabled;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final double? width;

  final double? height;

  final Color? backgroundColor;

  final ButtonSize size;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.height,
    this.backgroundColor,
    this.size = ButtonSize.medium,
  });

  double get _buttonHeight {
    switch (size) {
      case ButtonSize.small:
        return 44;

      case ButtonSize.medium:
        return 54;

      case ButtonSize.large:
        return 60;
    }
  }

  double get _fontSize {
    switch (size) {
      case ButtonSize.small:
        return 14;

      case ButtonSize.medium:
        return 16;

      case ButtonSize.large:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool disabled = !isEnabled || isLoading;

    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? _buttonHeight,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primary,
          disabledBackgroundColor: AppColors.border,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: isLoading
              ? const SizedBox(
            key: ValueKey("loader"),
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.4,
              color: Colors.white,
            ),
          )
              : Row(
            key: const ValueKey("text"),
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  size: 20,
                ),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(
                text,
                style: AppTextStyles.button.copyWith(
                  fontSize: _fontSize,
                ),
              ),
              if (trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.sm),
                Icon(
                  trailingIcon,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}