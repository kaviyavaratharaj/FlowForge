import 'package:flutter/material.dart';

import 'package:flowforge/app/theme/text_style.dart';
import 'package:flowforge/app/theme/app_colors.dart';
import 'package:flowforge/app/theme/spacing.dart';
import 'package:flowforge/shared/widgets/textfields/app_text_field.dart';
import 'package:flowforge/shared/widgets/textfields/password_field.dart';
import 'package:flowforge/shared/widgets/buttons/primary_button.dart';
import 'package:flowforge/shared/widgets/buttons/social_button.dart';
import 'package:flowforge/shared/widgets/divider/app_divider.dart';
import 'package:flowforge/features/authentication/presentation/pages/signup_page.dart';
import 'package:flowforge/features/authentication/presentation/pages/forgot_password.dart';
import 'package:flowforge/features/authentication/presentation/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool rememberMe = false;

  Future<void> _login() async {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/f_logo.png',
                    width: 150,
                  ),
                ),
                Text(
                  "Welcome Back!",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  "Login to continue to FlowForge",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: AppSpacing.md),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: emailController,
                        label: "Email",
                        hint: "Enter your email",
                        prefixIcon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Email is required";
                          }

                          final emailRegex = RegExp(
                            r'^[\w\.-]+@[\w\.-]+\.\w+$',
                          );

                          if (!emailRegex.hasMatch(value.trim())) {
                            return "Enter a valid email address";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: AppSpacing.md),
                      PasswordField(
                        controller: passwordController,
                        label: "Password",
                        hint: "Enter your password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }

                            if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }

                            return null;
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.sm),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                  onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage()));
                      },
                      child: Text(
                      "Forgot Password?", style: AppTextStyles.button.copyWith(
                        color: AppColors.primary,
                      ),),
                        ),
                ),
                SizedBox(height: AppSpacing.md),
                PrimaryButton(
                    text: "Login",
                  isLoading: isLoading,
                  onPressed: _login),
                SizedBox(height: AppSpacing.sm),
                AppDivider(),
                SizedBox(height: AppSpacing.sm),
                SocialButton(
                  text: "Continue with Google",
                  icon: "assets/images/google_image.png",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Google Login Coming Soon"),
                      ),
                    );
                  },
                ),
              ],
            ),
      )),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 24,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(width: 6),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignUpPage(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
