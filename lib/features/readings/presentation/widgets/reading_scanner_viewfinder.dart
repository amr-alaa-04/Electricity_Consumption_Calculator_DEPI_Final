import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ReadingScannerViewfinder extends StatefulWidget {
  const ReadingScannerViewfinder({
    required this.l10n,
    required this.readingDigits,
    required this.readingFraction,
    required this.accuracyPercent,
    required this.ocrVersion,
    required this.onFlashPressed,
    required this.onRetakePressed,
    super.key,
  });

  final AppLocalizations l10n;
  final String readingDigits;
  final String readingFraction;
  final int accuracyPercent;
  final String ocrVersion;
  final VoidCallback onFlashPressed;
  final VoidCallback onRetakePressed;

  @override
  State<ReadingScannerViewfinder> createState() => _ReadingScannerViewfinderState();
}

class _ReadingScannerViewfinderState extends State<ReadingScannerViewfinder>
    with TickerProviderStateMixin {
  late final AnimationController _scanController;
  late final AnimationController _pulseController;
  late final Animation<double> _scanPosition;
  late final Animation<double> _bracketOpacity;

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    )..repeat();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _scanPosition = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.08, end: 0.88), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.88, end: 0.08), weight: 1),
    ]).animate(_scanController);
    _bracketOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.35, end: 0.75), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.75, end: 0.35), weight: 1),
    ]).animate(_pulseController);
  }

  @override
  void dispose() {
    _scanController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    padding: EdgeInsets.zero,
    backgroundColor: AppColors.inverseSurface,
    borderColor: AppColors.primary.withValues(alpha: 0.2),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 2,
    child: ClipRRect(
      borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 224, child: _viewfinder()),
          Container(
            color: AppColors.primaryContainer.withValues(alpha: 0.9),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.medium,
              vertical: AppSpacing.small + AppSpacing.micro,
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryFixed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 16, color: AppColors.primary),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Text(
                    widget.l10n.readingsOcrSuccess(widget.accuracyPercent),
                    style: AppTypography.textTheme.labelMedium?.copyWith(
                      color: AppColors.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.small),
                Text(
                  widget.l10n.readingsOcrVersion(widget.ocrVersion),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.secondaryFixed,
                    fontFamily: AppTypography.latinFontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _viewfinder() => LayoutBuilder(
    builder: (context, constraints) => Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.tertiary, AppColors.inverseSurface, AppColors.primary],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.inverseSurface.withValues(alpha: 0.7),
                Colors.transparent,
                AppColors.inverseSurface.withValues(alpha: 0.85),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _bracketOpacity,
          builder: (context, child) => Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.large),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryFixed.withValues(alpha: _bracketOpacity.value),
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(AppShapeTokens.large),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      right: 8,
                      child: _corner(true, true, _bracketOpacity.value),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: _corner(true, false, _bracketOpacity.value),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: _corner(false, true, _bracketOpacity.value),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: _corner(false, false, _bracketOpacity.value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _scanPosition,
          builder: (context, child) => Positioned(
            top: 18 + (constraints.maxHeight - 36) * _scanPosition.value,
            left: AppSpacing.large,
            right: AppSpacing.large,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.transparent, AppColors.secondaryFixed, Colors.transparent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryFixed.withValues(alpha: 0.65),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(child: _detectedReading()),
        Positioned(
          bottom: AppSpacing.small + AppSpacing.micro,
          right: AppSpacing.medium,
          child: _flashButton(),
        ),
        Positioned(
          bottom: AppSpacing.small + AppSpacing.micro,
          left: AppSpacing.medium,
          child: _retakeButton(),
        ),
      ],
    ),
  );

  Widget _detectedReading() => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.inverseSurface.withValues(alpha: 0.88),
      border: Border.all(color: AppColors.secondary.withValues(alpha: 0.4)),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
      boxShadow: [
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.3),
          blurRadius: 12,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium + AppSpacing.small,
        vertical: AppSpacing.small + AppSpacing.micro,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryFixed,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppSpacing.micro),
              Text(
                widget.l10n.readingsDetectedMeterScreen,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.secondaryFixed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.micro),
          Directionality(
            textDirection: TextDirection.ltr,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var index = 0; index < widget.readingDigits.length; index++) ...[
                    if (index > 0) const SizedBox(width: AppSpacing.micro),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: index < 2
                            ? AppColors.primary.withValues(alpha: 0.5)
                            : AppColors.primaryContainer,
                        border: Border.all(
                          color: index < 2
                              ? AppColors.secondary.withValues(alpha: 0.2)
                              : AppColors.secondaryFixed,
                        ),
                        borderRadius: const BorderRadius.all(AppShapeTokens.standard),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.small - AppSpacing.micro,
                          vertical: AppSpacing.micro,
                        ),
                        child: Text(
                          widget.readingDigits[index],
                          style: AppTypography.textTheme.headlineLarge?.copyWith(
                            color: AppColors.secondaryFixed,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: AppSpacing.micro),
                  Text(
                    widget.readingFraction,
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.secondaryFixedDim,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _flashButton() => AppButton(
    variant: AppButtonVariant.outlined,
    onPressed: widget.onFlashPressed,
    leadingIcon: const Icon(Icons.flash_on, size: 16),
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(0, 34),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small + AppSpacing.micro),
      foregroundColor: AppColors.surfaceVariant,
      backgroundColor: AppColors.inverseSurface.withValues(alpha: 0.8),
      side: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(AppShapeTokens.pill),
      ),
      textStyle: AppTypography.textTheme.labelSmall,
    ),
    child: Text(widget.l10n.readingsFlash),
  );

  Widget _retakeButton() => AppButton(
    onPressed: widget.onRetakePressed,
    leadingIcon: const Icon(Icons.refresh, size: 16),
    style: FilledButton.styleFrom(
      minimumSize: const Size(0, 34),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small + AppSpacing.micro),
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.onSecondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(AppShapeTokens.pill),
      ),
      textStyle: AppTypography.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
    ),
    child: Text(widget.l10n.readingsRetake),
  );

  Widget _corner(bool top, bool right, double opacity) => SizedBox(
    width: 16,
    height: 16,
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: top
              ? BorderSide(color: AppColors.secondaryFixed.withValues(alpha: opacity), width: 2)
              : BorderSide.none,
          bottom: top
              ? BorderSide.none
              : BorderSide(color: AppColors.secondaryFixed.withValues(alpha: opacity), width: 2),
          right: right
              ? BorderSide(color: AppColors.secondaryFixed.withValues(alpha: opacity), width: 2)
              : BorderSide.none,
          left: right
              ? BorderSide.none
              : BorderSide(color: AppColors.secondaryFixed.withValues(alpha: opacity), width: 2),
        ),
      ),
    ),
  );
}
