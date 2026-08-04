import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/radius.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/text_style.dart';
import '../../enums/button_size.dart';

class SecondaryButton extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final bool isLoading;

  final bool isEnabled;

  final IconData? leadingIcon;

  final IconData? trailingIcon;

  final double? width;

  final double? height;

  final Color? borderColor;

  final Color? textColor;

  final ButtonSize size;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.leadingIcon,
    this.trailingIcon,
    this.width,
    this.height,
    this.borderColor,
    this.textColor,
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
    final bool disabled = isEnabled || isLoading;

    return SizedBox(
        width: width ?? double.infinity,
        height: height ?? _buttonHeight,
        child: OutlinedButton(
          onPressed: disabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
              elevation: 0,
              side: BorderSide(
                color: disabled
                    ? AppColors.border
                    : borderColor ?? AppColors.primary,
              ),
              foregroundColor: disabled ? AppColors.textDisabled : textColor ??
                  AppColors.primary,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              )
          ),
          child: AnimatedSwitcher(duration: const Duration(milliseconds: 250),
              child: isLoading
                  ? SizedBox(
                key: const ValueKey('loader'),
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: textColor ?? AppColors.primary,
                ),
              )
                  : Row(
              key: const ValueKey('text'),
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(leadingIcon != null) ...[
              Icon(leadingIcon, size: 20),
              const SizedBox(width: AppSpacing.sm)
            ],
            Text(text,
                style: AppTextStyles.button.copyWith(
                    color: disabled
                        ? AppColors.textDisabled
                        : textColor ?? AppColors.primary,
                    fontSize: _fontSize
                )),
            if(trailingIcon != null) ...[
              const SizedBox(width: AppSpacing.sm),
              Icon(trailingIcon, size: 20)
            ]

          ],
        )
    ),

    )
    ,
    );
  }
}
