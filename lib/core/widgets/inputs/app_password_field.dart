import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../buttons/app_icon_button.dart';
import 'app_text_field.dart';

/// Password field with a localized, accessible visibility toggle.
class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.enabled = true,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return AppTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      labelText: widget.labelText,
      hintText: widget.hintText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
      autocorrect: false,
      obscureText: _obscureText,
      enabled: widget.enabled,
      suffixIcon: AppIconButton(
        tooltip: _obscureText ? localizations.showPassword : localizations.hidePassword,
        onPressed: widget.enabled ? () => setState(() => _obscureText = !_obscureText) : null,
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        iconSize: 20,
      ),
    );
  }
}
