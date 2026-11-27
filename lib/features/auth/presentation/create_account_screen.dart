import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'widgets/create_account_form_card.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('create-account-screen'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.marginMobile,
              AppSpacing.large,
              AppSpacing.marginMobile,
              AppSpacing.large,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 448),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - AppSpacing.large * 2,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _brandHeader(l10n),
                      const SizedBox(height: AppSpacing.large),
                      CreateAccountFormCard(l10n: l10n),
                      const SizedBox(height: AppSpacing.medium),
                      _backToLogin(context, l10n),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _brandHeader(AppLocalizations l10n) => Column(
    children: [
      const AppIconTile(
        icon: Icons.bolt,
        size: 72,
        iconSize: 42,
        backgroundColor: AppColors.surfaceContainerLowest,
        iconColor: AppColors.primary,
        borderRadius: BorderRadius.all(AppShapeTokens.large),
      ),
      const SizedBox(height: AppSpacing.small),
      Text(
        l10n.appTitle,
        textAlign: TextAlign.center,
        style: AppTypography.headlineLargeMobile.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: AppSpacing.micro),
      Text(
        l10n.welcomeSubtitle,
        textAlign: TextAlign.center,
        style: AppTypography.textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
    ],
  );

  Widget _backToLogin(BuildContext context, AppLocalizations l10n) => TextButton(
    key: const ValueKey('create-account-back-to-login'),
    onPressed: () => context.go('/welcome-login'),
    style: TextButton.styleFrom(
      minimumSize: const Size(0, 44),
      foregroundColor: AppColors.secondary,
      textStyle: AppTypography.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    ),
    child: Text(l10n.createAccountBackToLogin),
  );
}
