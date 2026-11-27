import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/inputs/app_password_field.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class WelcomeLoginFormCard extends StatelessWidget {
  const WelcomeLoginFormCard({
    required this.l10n,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onLoginPressed,
    required this.onGuestPressed,
    super.key,
  });

  final AppLocalizations l10n;
  final bool rememberMe;
  final ValueChanged<bool> onRememberMeChanged;
  final VoidCallback onLoginPressed;
  final VoidCallback onGuestPressed;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
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
        _rememberAndForgot(),
        const SizedBox(height: AppSpacing.small),
        AppButton(
          key: const ValueKey('welcome-login-button'),
          expand: true,
          onPressed: onLoginPressed,
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
        _divider(),
        const SizedBox(height: AppSpacing.medium),
        AppButton(
          key: const ValueKey('welcome-guest-button'),
          variant: AppButtonVariant.outlined,
          expand: true,
          onPressed: onGuestPressed,
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

  Widget _rememberAndForgot() => LayoutBuilder(
    builder: (context, constraints) {
      final rememberControl = InkWell(
        onTap: () => onRememberMeChanged(!rememberMe),
        borderRadius: const BorderRadius.all(AppShapeTokens.small),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              key: const ValueKey('welcome-remember-checkbox'),
              value: rememberMe,
              onChanged: (value) => onRememberMeChanged(value ?? false),
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

  Widget _divider() => Row(
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
}
