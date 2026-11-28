import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/inputs/app_number_field.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ManualReadingInput extends StatefulWidget {
  const ManualReadingInput({
    required this.l10n,
    required this.onReadingConfirmed,
    super.key,
  });

  final AppLocalizations l10n;
  final ValueChanged<String> onReadingConfirmed;

  @override
  State<ManualReadingInput> createState() => _ManualReadingInputState();
}

class _ManualReadingInputState extends State<ManualReadingInput> {
  final _formKey = GlobalKey<FormState>();
  final _readingController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    _readingController.dispose();
    super.dispose();
  }

  void _confirmReading() {
    if (!_formKey.currentState!.validate()) {
      setState(() => _autovalidateMode = AutovalidateMode.onUserInteraction);
      return;
    }

    final reading = AppNumberField.normalize(_readingController.text);
    if (reading != null) widget.onReadingConfirmed(reading);
  }

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    key: const ValueKey('manual-reading-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.large),
    child: Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppNumberField(
            key: const ValueKey('manual-reading-value'),
            controller: _readingController,
            labelText: widget.l10n.readingsManualInputLabel,
            hintText: widget.l10n.readingsManualInputHint,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return widget.l10n.readingsManualInputRequired;
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.medium),
          AppButton(
            key: const ValueKey('manual-reading-confirm'),
            expand: true,
            onPressed: _confirmReading,
            leadingIcon: const Icon(Icons.check, size: 20),
            style: FilledButton.styleFrom(
              minimumSize: const Size(0, 52),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: AppColors.onPrimary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(AppShapeTokens.large),
              ),
              textStyle: AppTypography.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            child: Text(widget.l10n.readingsManualInputConfirm),
          ),
        ],
      ),
    ),
  );
}
