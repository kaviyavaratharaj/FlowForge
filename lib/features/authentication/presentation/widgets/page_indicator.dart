import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? AppColors.primary
                : AppColors.border,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}