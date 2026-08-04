import 'package:flutter/material.dart';

import '../../../../app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flowforge/app/theme/spacing.dart';
import 'package:flowforge/app/theme/text_style.dart';
import 'package:flowforge/shared/widgets/buttons/primary_button.dart';
import 'package:flowforge/shared/widgets/buttons/secondary_button.dart';
import 'package:flowforge/shared/widgets/textfields/app_text_field.dart';
import 'package:flowforge/shared/widgets/textfields/password_field.dart';
import 'package:flowforge/shared/widgets/textfields/search_field.dart';
import 'package:flowforge/shared/widgets/cards/app_cards.dart';
import 'package:flowforge/shared/widgets/cards/project_card.dart';
import 'package:flowforge/shared/widgets/cards/stat_card.dart';
import 'package:flowforge/shared/widgets/avatar/app_avatar.dart';

class UiKitPreviewPage extends StatefulWidget {
  const UiKitPreviewPage({super.key});

  @override
  State<UiKitPreviewPage> createState() => _UiKitPreviewPageState();
}

class _UiKitPreviewPageState extends State<UiKitPreviewPage> {

  late final TextEditingController emailController;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowForge UI Kit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              controller: emailController,
              label: "Email",
              hint: "Enter your email",
              prefixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: AppSpacing.lg),
            PasswordField(
              label: "Password",
              hint: "Enter your password",
            ),

            const SizedBox(height: AppSpacing.lg),

            SearchField(
              controller: searchController,
              hint: "Search projects",
              onChanged: (value) {
                print(value);
              },
            ),

            const SizedBox(height: 20),

            AppAvatar(
              initials: "KV",
            ),
            const SizedBox(height: 20),

            PrimaryButton(
              text: "Login",
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.lg),

            SecondaryButton(
              text: "Cancel",
              onPressed: () {},
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              "Base Card",
              style: AppTextStyles.titleLarge,
            ),

            const SizedBox(height: AppSpacing.md),

            AppCards(
              onTap: () {
                debugPrint("AppCard tapped");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to FlowForge",
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    "This is the reusable AppCard component.",
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),
            StatCard(
              title: "Tasks Done",
              value: "128",
              growth: "+12%",
              icon: Icons.task_alt,
            ),

            const SizedBox(height: 20),

            ProjectCard(
              title: "FlowForge Mobile",
              member: "6 Members",
              progress: .72,
            ),


          ],
        ),),
      ),
    );
  }
}
