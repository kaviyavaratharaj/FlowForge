import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/spacing.dart';
import '../../../app/theme/text_style.dart';
import '../avatar/app_avatar.dart';
import 'app_cards.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String member;
  final double progress;

  const ProjectCard({super.key,
  required this.title,
  required this.member,
  required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return AppCards(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.titleLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            member,
            style: AppTextStyles.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),

          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              )
          ),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${(progress * 100).toInt()}%",
              style: AppTextStyles.bodyMedium,
            ),
          )
        ],
      )
    );
  }
}
