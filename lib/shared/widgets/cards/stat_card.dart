import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/text_style.dart';
import 'app_cards.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String growth;
  final IconData icon;

  const StatCard({super.key,
  required this.title,
  required this.value,
  required this.growth,
  required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppCards(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
          color: AppColors.primary,size: 28),
          const SizedBox(height: AppSpacing.md),
          Text(title,style: AppTextStyles.bodyMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(value,style: AppTextStyles.headlineLarge),
          const SizedBox(height: AppSpacing.sm),
          Text(growth,style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.success,
          )),
        ],
      )
    );
  }
}
