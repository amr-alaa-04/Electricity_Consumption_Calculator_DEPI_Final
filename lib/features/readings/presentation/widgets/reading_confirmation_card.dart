import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'reading_comparison_summary.dart';
import 'reading_date_time_field.dart';

class ReadingConfirmationCard extends StatefulWidget {
  const ReadingConfirmationCard({
    required this.l10n,
    required this.initialReading,
    required this.previousReading,
    required this.consumptionDifference,
    required this.consumptionTier,
    required this.previousReadingDate,
    required this.initialRecordedAt,
    required this.initialNotes,
    super.key,
  });

  final AppLocalizations l10n;
  final String initialReading;
  final String previousReading;
  final String consumptionDifference;
  final String consumptionTier;
  final DateTime previousReadingDate;
  final DateTime initialRecordedAt;
  final String initialNotes;

  @override
  State<ReadingConfirmationCard> createState() => _ReadingConfirmationCardState();
}

class _ReadingConfirmationCardState extends State<ReadingConfirmationCard> {
  late final TextEditingController _readingController;
  late final TextEditingController _notesController;
  late DateTime _recordedAt;

  @override
  void initState() {
    super.initState();
    _readingController = TextEditingController(text: widget.initialReading);
    _notesController = TextEditingController(text: widget.initialNotes);
    _recordedAt = widget.initialRecordedAt;
  }

  @override
  void didUpdateWidget(covariant ReadingConfirmationCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialNotes != widget.initialNotes &&
        _notesController.text == oldWidget.initialNotes) {
      _notesController.text = widget.initialNotes;
    }
  }

  @override
  void dispose() {
    _readingController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;

    return AppSurfaceCard(
      key: const ValueKey('reading-confirmation-card'),
      padding: const EdgeInsets.all(AppSpacing.medium),
      borderRadius: const BorderRadius.all(AppShapeTokens.large),
      elevation: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _currentReadingHeader(l10n),
          const SizedBox(height: AppSpacing.micro + 2),
          _currentReadingField(l10n),
          const SizedBox(height: AppSpacing.medium),
          ReadingComparisonSummary(
            l10n: l10n,
            previousReading: widget.previousReading,
            consumptionDifference: widget.consumptionDifference,
            consumptionTier: widget.consumptionTier,
            previousReadingDate: widget.previousReadingDate,
          ),
          const SizedBox(height: AppSpacing.medium),
          _verificationBadge(l10n),
          const SizedBox(height: AppSpacing.medium),
          ReadingDateTimeField(
            l10n: l10n,
            value: _recordedAt,
            onChanged: (value) => setState(() => _recordedAt = value),
          ),
          const SizedBox(height: AppSpacing.medium),
          _notesField(l10n),
        ],
      ),
    );
  }

  Widget _currentReadingHeader(AppLocalizations l10n) => Wrap(
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: AppSpacing.small,
    runSpacing: AppSpacing.micro,
    children: [
      Text(
        l10n.readingsCurrentReading,
        style: AppTypography.textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        l10n.readingsEditableManually,
        style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
      ),
    ],
  );

  Widget _currentReadingField(AppLocalizations l10n) => TextField(
    key: const ValueKey('reading-current-value'),
    controller: _readingController,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.end,
    style: AppTypography.textTheme.headlineLarge?.copyWith(
      color: AppColors.primary,
      fontWeight: FontWeight.w700,
      fontFeatures: const [FontFeature.tabularFigures()],
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.surfaceContainerLow,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.small + AppSpacing.micro,
      ),
      suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      suffixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: AppSpacing.small,
          end: AppSpacing.medium,
          top: AppSpacing.small,
          bottom: AppSpacing.small,
        ),
        child: _unitBadge(l10n),
      ),
      border: _readingInputBorder(AppColors.secondary.withValues(alpha: 0.3)),
      enabledBorder: _readingInputBorder(AppColors.secondary.withValues(alpha: 0.3)),
      focusedBorder: _readingInputBorder(AppColors.secondary, width: 2),
    ),
  );

  Widget _unitBadge(AppLocalizations l10n) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerHigh,
      border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.small + AppSpacing.micro,
        vertical: AppSpacing.micro,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.homeEnergyUnit,
            style: AppTypography.textTheme.labelLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: AppSpacing.micro),
          Text(
            l10n.readingsEnergyUnitParenthetical,
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    ),
  );

  OutlineInputBorder _readingInputBorder(Color color, {double width = 1}) => OutlineInputBorder(
    borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    borderSide: BorderSide(color: color, width: width),
  );

  Widget _verificationBadge(AppLocalizations l10n) => Container(
    padding: const EdgeInsets.all(AppSpacing.small + AppSpacing.micro),
    decoration: BoxDecoration(
      color: AppColors.secondaryContainer.withValues(alpha: 0.4),
      border: Border.all(color: AppColors.secondaryFixed),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      children: [
        const Icon(Icons.verified, size: 20, color: AppColors.secondary),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            l10n.readingsVerificationStatus,
            style: AppTypography.textTheme.labelMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _notesField(AppLocalizations l10n) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.micro),
        child: Text(
          l10n.readingsNotesLabel,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
      AppTextField(
        key: const ValueKey('reading-notes'),
        controller: _notesController,
        hintText: l10n.readingsNotesHint,
        textInputAction: TextInputAction.done,
        suffixIcon: const Icon(Icons.sticky_note_2_outlined),
      ),
    ],
  );
}
