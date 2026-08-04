import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/text_style.dart';

class AppDivider extends StatelessWidget {
  final String text;

  const AppDivider({
    super.key,
    this.text = "OR",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.border,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.border,
          ),
        ),
      ],
    );
  }
}