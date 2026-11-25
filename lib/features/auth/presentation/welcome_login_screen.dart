import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/inputs/app_password_field.dart';
import '../../../core/widgets/inputs/app_text_field.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../l10n/generated/app_localizations.dart';

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
                      _formCard(context, l10n),
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

  Widget _formCard(BuildContext context, AppLocalizations l10n) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.large),
    borderRadius: const BorderRadius.all(AppShapeTokens.large),
    elevation: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          key: const ValueKey('welcome-login-title'),
          l10n.welcomeLoginTitle,
          style: AppTypography.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.micro),
        Text(
          l10n.welcomeLoginGreeting,
          style: AppTypography.textTheme.bodySmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.welcomeIdentifierLabel),
        AppTextField(
          key: const ValueKey('welcome-identifier'),
          hintText: l10n.welcomeIdentifierHint,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          textDirection: TextDirection.ltr,
          autocorrect: false,
          prefixIcon: const Icon(Icons.mail_outline),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.welcomePasswordLabel),
        AppPasswordField(
          key: const ValueKey('welcome-password'),
          hintText: l10n.welcomePasswordHint,
        ),
        const SizedBox(height: AppSpacing.small),
        _rememberAndForgot(l10n),
        const SizedBox(height: AppSpacing.small),
        AppButton(
          key: const ValueKey('welcome-login-button'),
          expand: true,
          onPressed: () => context.go('/main-home'),
          trailingIcon: MediaQuery.sizeOf(context).width < 360
              ? null
              : Transform.flip(
                  flipX: Directionality.of(context) == TextDirection.rtl,
                  child: const Icon(Icons.arrow_forward, size: 20),
                ),
          style: FilledButton.styleFrom(
            minimumSize: const Size(0, 52),
            backgroundColor: AppColors.primaryContainer,
            foregroundColor: AppColors.onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppShapeTokens.large),
            ),
            textStyle: AppTypography.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          child: Flexible(
            child: Text(l10n.welcomeLoginTitle, textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        _divider(l10n),
        const SizedBox(height: AppSpacing.medium),
        AppButton(
          key: const ValueKey('welcome-guest-button'),
          variant: AppButtonVariant.outlined,
          expand: true,
          onPressed: () {},
          leadingIcon: MediaQuery.sizeOf(context).width < 360
              ? null
              : const Icon(Icons.bolt, size: 20),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(0, 50),
            foregroundColor: AppColors.primaryContainer,
            side: const BorderSide(color: AppColors.secondary),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppShapeTokens.large),
            ),
            textStyle: AppTypography.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Flexible(
            child: Text(
              l10n.welcomeGuest,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _fieldLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.micro),
    child: Text(
      text,
      style: AppTypography.textTheme.labelMedium?.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _rememberAndForgot(AppLocalizations l10n) => LayoutBuilder(
    builder: (context, constraints) {
      final rememberControl = InkWell(
        onTap: () => setState(() => _rememberMe = !_rememberMe),
        borderRadius: const BorderRadius.all(AppShapeTokens.small),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              key: const ValueKey('welcome-remember-checkbox'),
              value: _rememberMe,
              onChanged: (value) => setState(() => _rememberMe = value ?? false),
              activeColor: AppColors.primaryContainer,
              visualDensity: VisualDensity.compact,
            ),
            Text(
              l10n.welcomeRememberMe,
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
      );
      final forgotButton = TextButton(
        key: const ValueKey('welcome-forgot-password'),
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: const Size(0, 40),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
          foregroundColor: AppColors.secondary,
          textStyle: AppTypography.textTheme.labelMedium,
        ),
        child: Text(l10n.welcomeForgotPassword, textAlign: TextAlign.end),
      );

      if (constraints.maxWidth < 360) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(alignment: AlignmentDirectional.centerStart, child: rememberControl),
            Align(alignment: AlignmentDirectional.centerEnd, child: forgotButton),
          ],
        );
      }

      return Row(
        children: [
          Flexible(child: rememberControl),
          const SizedBox(width: AppSpacing.small),
          Flexible(child: forgotButton),
        ],
      );
    },
  );

  Widget _divider(AppLocalizations l10n) => Row(
    children: [
      const Expanded(child: Divider(height: 1)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small),
        child: Text(
          l10n.welcomeContinueDivider,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
      const Expanded(child: Divider(height: 1)),
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
