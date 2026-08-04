import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';
import 'features/authentication/presentation/pages/ui_kit_preview_page.dart';
import 'features/authentication/presentation/pages/splash_page.dart';

void main() {
  runApp(const FlowForgeApp());
}

class FlowForgeApp extends StatelessWidget {
  const FlowForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowForge',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashPage(),
    );
  }
}