import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/spacing.dart';
import '../../../../app/theme/text_style.dart';
import 'package:flowforge/features/authentication/presentation/widgets/onboarding _item.dart';
import 'package:flowforge/features/authentication/domain/entities/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final onboardingModel item;

  const OnboardingItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [

          const Spacer(),

          Image.asset(
            item.image,
            height: 280,
          ),

          const SizedBox(height: AppSpacing.xl),

          Text(
            item.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.headlineLarge,
          ),

          const SizedBox(height: AppSpacing.md),

          Text(
            item.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}