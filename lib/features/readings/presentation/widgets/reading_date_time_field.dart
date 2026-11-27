import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ReadingDateTimeField extends StatelessWidget {
  const ReadingDateTimeField({
    required this.l10n,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final AppLocalizations l10n;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    final materialLocalizations = MaterialLocalizations.of(context);
    final date = materialLocalizations.formatMediumDate(value);
    final time = materialLocalizations.formatTimeOfDay(TimeOfDay.fromDateTime(value));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.micro),
          child: Text(
            l10n.readingsDateTimeLabel,
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 52),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.4)),
            borderRadius: const BorderRadius.all(AppShapeTokens.medium),
          ),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.small,
            runSpacing: AppSpacing.small,
            children: [
              Semantics(
                button: true,
                label: l10n.readingsSelectDate,
                child: InkWell(
                  key: const ValueKey('reading-date-picker'),
                  onTap: () => _pickDate(context),
                  borderRadius: const BorderRadius.all(AppShapeTokens.small),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: AppSpacing.small,
                      children: [
                        const Icon(Icons.calendar_today, size: 18, color: AppColors.primary),
                        Text(
                          date,
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('•', style: TextStyle(color: AppColors.outlineVariant)),
                  const SizedBox(width: AppSpacing.small),
                  Semantics(
                    button: true,
                    label: l10n.readingsSelectTime,
                    child: InkWell(
                      key: const ValueKey('reading-time-picker'),
                      onTap: () => _pickTime(context),
                      borderRadius: const BorderRadius.all(AppShapeTokens.small),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                        child: Text(
                          time,
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurface,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.small),
                  const Icon(Icons.edit_calendar, size: 18, color: AppColors.onSurfaceVariant),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selected == null || !context.mounted) return;

    onChanged(
      DateTime(selected.year, selected.month, selected.day, value.hour, value.minute),
    );
  }

  Future<void> _pickTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(value),
    );
    if (selected == null || !context.mounted) return;

    onChanged(
      DateTime(value.year, value.month, value.day, selected.hour, selected.minute),
    );
  }
}
