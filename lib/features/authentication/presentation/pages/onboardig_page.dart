import 'package:flutter/material.dart';

import 'package:flowforge/features/authentication/data/models/onboarding_data.dart';
import 'package:flowforge/features/authentication/domain/entities/onboarding_model.dart';
import 'package:flowforge/features/authentication/presentation/widgets/skip_button.dart';
import 'package:flowforge/features/authentication/presentation/widgets/onboarding _item.dart';
import 'package:flowforge/features/authentication/presentation/widgets/next_button.dart';
import 'package:flowforge/features/authentication/presentation/widgets/page_indicator.dart';
import 'package:flowforge/app/theme/text_style.dart';
import 'package:flowforge/features/authentication/presentation/pages/login_page.dart';
import 'package:flowforge/shared/widgets/buttons/primary_button.dart';
import 'package:flowforge/core/services/preferece_services.dart';

class OnboardigPage extends StatefulWidget {
  const OnboardigPage({super.key});

  @override
  State<OnboardigPage> createState() => _OnboardigPageState();
}

class _OnboardigPageState extends State<OnboardigPage> {

  final PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _skip() {
    _pageController.animateToPage(
      onboardingData.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finishOnboarding() async {

    await PreferenceService.setFirstLaunchCompleted();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return OnboardingItem(
                    item: onboardingData[index],
                  );
                },
              ),
            ),

            PageIndicator(
              currentIndex: _currentIndex,
              count: onboardingData.length,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _currentIndex == onboardingData.length - 1
                    ? PrimaryButton(
                  text: "Get Started",
                  onPressed: _finishOnboarding,
                )
                    : Row(
                  children: [
                    SkipButton(
                      onTap: _skip,
                    ),
                    const Spacer(),
                    NextButton(
                      onPressed: _nextPage,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            ],
        ),
      ),
    );

  }
}
