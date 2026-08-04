import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/text_style.dart';

class AppAvatar extends StatelessWidget {
  final String initials;
  final double radius;

  const AppAvatar({super.key,
    required this.initials,
    this.radius = 22
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primary.withOpacity(.12),
      child: Text(initials,
          style: AppTextStyles.bodyLarge.copyWith(
            color: AppColors.primary
          )),
    );
  }
}
