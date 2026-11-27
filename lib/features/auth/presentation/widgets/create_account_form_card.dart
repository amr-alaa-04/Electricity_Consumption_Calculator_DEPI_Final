import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/inputs/app_password_field.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class CreateAccountFormCard extends StatelessWidget {
  const CreateAccountFormCard({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.large),
    borderRadius: const BorderRadius.all(AppShapeTokens.large),
    elevation: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          key: const ValueKey('create-account-title'),
          l10n.createAccountTitle,
          style: AppTypography.textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.createAccountFullNameLabel),
        AppTextField(
          key: const ValueKey('create-account-full-name'),
          hintText: l10n.createAccountFullNameHint,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.name],
          prefixIcon: const Icon(Icons.person_outline),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.createAccountEmailLabel),
        AppTextField(
          key: const ValueKey('create-account-email'),
          hintText: l10n.createAccountEmailHint,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          textDirection: TextDirection.ltr,
          autofillHints: const [AutofillHints.email],
          autocorrect: false,
          prefixIcon: const Icon(Icons.mail_outline),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.createAccountPhoneLabel),
        AppTextField(
          key: const ValueKey('create-account-phone'),
          hintText: l10n.createAccountPhoneHint,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          textDirection: TextDirection.ltr,
          autofillHints: const [AutofillHints.telephoneNumber],
          prefixIcon: const Icon(Icons.phone_outlined),
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.welcomePasswordLabel),
        AppPasswordField(
          key: const ValueKey('create-account-password'),
          hintText: l10n.createAccountPasswordHint,
        ),
        const SizedBox(height: AppSpacing.medium),
        _fieldLabel(l10n.createAccountConfirmPasswordLabel),
        AppPasswordField(
          key: const ValueKey('create-account-confirm-password'),
          hintText: l10n.createAccountConfirmPasswordHint,
        ),
        const SizedBox(height: AppSpacing.large),
        AppButton(
          key: const ValueKey('create-account-submit'),
          expand: true,
          onPressed: () {},
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
          child: Text(l10n.createAccountButton),
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
}
