import 'package:flutter/material.dart';

import '../../../app/theme/text_style.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/app_fonts.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? label;
  final String? hint;

  final IconData? prefixIcon;
  final Widget? suffixIcon;

  final bool readOnly;
  final bool enabled;
  final bool obscureText;

  final int maxLines;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          if(label != null) ...[
            Text(
              label!,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontFamily: AppFonts.satoshi,
                fontWeight: AppFonts.medium
              ),
            ),
            const SizedBox(height: AppSpacing.sm)
          ],
            TextFormField(
            controller: controller,
            focusNode: focusNode,
            readOnly: readOnly,
            enabled: enabled,
            obscureText: obscureText,
            maxLines: obscureText ? 1 : maxLines,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            style: AppTextStyles.bodyLarge,
            decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon
            ),
            ),
      ],
    );
  }
}
