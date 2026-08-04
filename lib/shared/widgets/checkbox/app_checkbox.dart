import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/text_style.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool?> onChanged;

  const AppCheckbox({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Checkbox(
            value: value,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),

          Text(
            title,
            style: AppTextStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}