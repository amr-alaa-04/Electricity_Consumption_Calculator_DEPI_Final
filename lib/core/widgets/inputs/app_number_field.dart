import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../l10n/generated/app_localizations.dart';
import 'app_text_field.dart';

/// Numeric entry field with decimal input and localized digit support.
/// Domain-specific range validation remains the caller's responsibility.
class AppNumberField extends StatelessWidget {
  const AppNumberField({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.validator,
    this.onChanged,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  /// Converts supported localized digits and separators into parseable text.
  ///
  /// Western and Arabic decimal separators are normalized to `.`. Western
  /// commas and Arabic thousands separators are accepted only in valid groups
  /// of three digits. The displayed field text is never changed by this method.
  static String? normalize(String? input) {
    if (input == null) return null;

    final digits = StringBuffer();
    for (final rune in input.trim().runes) {
      if (rune >= 0x0660 && rune <= 0x0669) {
        digits.writeCharCode(0x30 + rune - 0x0660);
      } else if (rune >= 0x06F0 && rune <= 0x06F9) {
        digits.writeCharCode(0x30 + rune - 0x06F0);
      } else if (rune == 0x066B) {
        digits.write('.');
      } else {
        digits.writeCharCode(rune);
      }
    }

    final normalized = digits.toString();
    if (normalized.isEmpty || '.'.allMatches(normalized).length > 1) {
      return null;
    }

    final decimalIndex = normalized.indexOf('.');
    final integerPart = decimalIndex < 0 ? normalized : normalized.substring(0, decimalIndex);
    final fractionPart = decimalIndex < 0 ? null : normalized.substring(decimalIndex + 1);

    if (fractionPart != null && !RegExp(r'^[0-9]*$').hasMatch(fractionPart)) {
      return null;
    }

    var normalizedInteger = integerPart;
    if (integerPart.contains(',') || integerPart.contains('٬')) {
      final separator = integerPart.contains(',') ? ',' : '٬';
      if (integerPart.contains(separator == ',' ? '٬' : ',')) return null;
      final groupedInteger = RegExp(
        '^[0-9]{1,3}(?:${RegExp.escape(separator)}[0-9]{3})+\$',
      );
      if (!groupedInteger.hasMatch(integerPart)) return null;
      normalizedInteger = integerPart.replaceAll(separator, '');
    } else if (!RegExp(r'^[0-9]*$').hasMatch(integerPart)) {
      return null;
    }

    if (normalizedInteger.isEmpty && (fractionPart == null || fractionPart.isEmpty)) {
      return null;
    }

    return fractionPart == null ? normalizedInteger : '$normalizedInteger.$fractionPart';
  }

  /// Parses [input] after localized digits and separators have been normalized.
  static double? tryParse(String? input) {
    final normalized = normalize(input);
    return normalized == null ? null : double.tryParse(normalized);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AppTextField(
      controller: controller,
      focusNode: focusNode,
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      validator: (value) {
        if (value != null && value.trim().isNotEmpty && normalize(value) == null) {
          return localizations.invalidNumber;
        }
        return validator?.call(value);
      },
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final filteredText = newValue.text.replaceAll(
            RegExp(r'[^0-9٠-٩۰-۹.,٫٬]'),
            '',
          );
          if ('.'.allMatches(filteredText).length + '٫'.allMatches(filteredText).length > 1) {
            return oldValue;
          }

          return newValue.copyWith(
            text: filteredText,
            selection: TextSelection.collapsed(offset: filteredText.length),
            composing: TextRange.empty,
          );
        }),
      ],
      enabled: enabled,
    );
  }
}
