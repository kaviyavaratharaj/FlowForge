import 'package:flutter/material.dart';

import 'package:flowforge/app/theme/text_style.dart';
import 'package:flowforge/app/theme/spacing.dart';
import 'package:flowforge/app/constants/app_constants.dart';
import 'package:flowforge/shared/widgets/loaders/app_loader.dart';
import 'package:flowforge/features/authentication/presentation/pages/onboardig_page.dart';
import 'package:flowforge/features/authentication/presentation/pages/login_page.dart';
import 'package:flowforge/core/services/preferece_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool _visible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          _navigate();
          _visible = true;
        });
      }
    });
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    final isFirstLaunch = await PreferenceService.isFirstLaunch();

    print("Splash: $isFirstLaunch");

    if (!mounted) return;

    if (isFirstLaunch) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardigPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    }
  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Container(
            color: Colors.white,
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/wave_bg.png",
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.22,
              fit: BoxFit.fill,
            ),
          ),

          Center(
            child: AnimatedSlide(
              offset: _visible ? Offset.zero : const Offset(0, 0.08),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/flowforge_logo.png",
                      width: 300,
                    ),
                    Text(
                      "Manage Projects Beautifully",
                      style: AppTextStyles.bodyMedium,
                    ),

                    const SizedBox(height: 70),
                    const AppLoader(
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 55,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Version ${AppConstants.appVersion}",
                style: AppTextStyles.bodyMedium,
              )
            ),
          ),
        ],
      ),
    );
  }
}
