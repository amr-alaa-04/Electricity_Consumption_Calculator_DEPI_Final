import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'app_input_decoration.dart';

/// Standard form field with shared design-system decoration and validation.
class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.helperText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.enabled = true,
    this.readOnly = false,
    this.autocorrect = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final bool readOnly;
  final bool autocorrect;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      textDirection: textDirection,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      enabled: enabled,
      readOnly: readOnly,
      autocorrect: autocorrect,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLength,
      style: AppTypography.textTheme.bodyMedium?.copyWith(
        color: AppColors.onSurface,
      ),
      decoration: AppInputDecoration.build(
        context,
        labelText: labelText,
        hintText: hintText,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
