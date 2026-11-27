import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'widgets/welcome_login_form_card.dart';

class WelcomeLoginScreen extends StatefulWidget {
  const WelcomeLoginScreen({super.key});

  @override
  State<WelcomeLoginScreen> createState() => _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends State<WelcomeLoginScreen> {
  bool _rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('welcome-login-screen'),
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
                      _header(l10n),
                      const SizedBox(height: AppSpacing.large),
                      WelcomeLoginFormCard(
                        l10n: l10n,
                        rememberMe: _rememberMe,
                        onRememberMeChanged: (value) => setState(() => _rememberMe = value),
                        onLoginPressed: () => context.go('/main-home'),
                        onGuestPressed: () {},
                      ),
                      const SizedBox(height: AppSpacing.medium),
                      _registerLink(l10n),
                      const SizedBox(height: AppSpacing.large),
                      _privacyNote(l10n),
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

  Widget _header(AppLocalizations l10n) => Column(
    children: [
      const AppIconTile(
        icon: Icons.bolt,
        size: 80,
        iconSize: 48,
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

  Widget _registerLink(AppLocalizations l10n) => Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: AppSpacing.micro,
    children: [
      Text(
        l10n.welcomeNoAccount,
        style: AppTypography.textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
      TextButton(
        key: const ValueKey('welcome-create-account'),
        onPressed: () => context.go('/create-account'),
        style: TextButton.styleFrom(
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
          foregroundColor: AppColors.secondary,
          textStyle: AppTypography.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        child: Text(l10n.welcomeCreateAccount),
      ),
    ],
  );

  Widget _privacyNote(AppLocalizations l10n) => Container(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.small,
      vertical: AppSpacing.small,
    ),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainer.withValues(alpha: 0.6),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
      border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.2)),
    ),
    child: Row(
      children: [
        const Icon(Icons.verified_user_outlined, size: 18, color: AppColors.secondary),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            l10n.welcomePrivacy,
            textAlign: TextAlign.center,
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ),
  );
}
