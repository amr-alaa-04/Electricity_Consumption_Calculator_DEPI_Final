import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';
import '../../theme/app_typography.dart';

/// Bottom navigation styled for the app's five primary destinations.
///
/// Destination labels are supplied by the caller so they can be localized.
class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.destinations,
    required this.currentIndex,
    required this.onDestinationSelected,
    this.backgroundColor,
    this.selectedItemBackgroundColor = AppColors.secondaryContainer,
    this.selectedItemForegroundColor = AppColors.primary,
    this.unselectedItemForegroundColor = AppColors.onSurfaceVariant,
    this.borderColor,
    this.shadowColor,
    this.selectedItemBorderRadius = const BorderRadius.all(
      AppShapeTokens.pill,
    ),
    this.height = 64,
    this.iconSize = 24,
    this.labelStyle,
    this.itemPadding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.small,
      vertical: AppSpacing.micro,
    ),
    this.safeAreaBottom = true,
    super.key,
  }) : assert(destinations.length > 0),
       assert(currentIndex >= 0 && currentIndex < destinations.length),
       assert(height > 0),
       assert(iconSize > 0);

  /// Destinations to display. Use localized labels from the caller.
  final List<NavigationDestination> destinations;

  /// Index of the currently selected destination.
  final int currentIndex;

  /// Called when a destination is tapped.
  final ValueChanged<int> onDestinationSelected;

  final Color? backgroundColor;
  final Color selectedItemBackgroundColor;
  final Color selectedItemForegroundColor;
  final Color unselectedItemForegroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final BorderRadius selectedItemBorderRadius;
  final double height;
  final double iconSize;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry itemPadding;
  final bool safeAreaBottom;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor =
        backgroundColor ?? AppColors.surfaceContainerLowest.withValues(alpha: 0.95);
    final effectiveBorderColor = borderColor ?? AppColors.outlineVariant.withValues(alpha: 0.3);
    final effectiveShadowColor = shadowColor ?? AppColors.onSurface.withValues(alpha: 0.06);
    final effectiveLabelStyle = labelStyle ?? AppTypography.textTheme.labelSmall!;

    final navigation = SizedBox(
      height: height,
      child: Row(
        children: [
          for (var index = 0; index < destinations.length; index++)
            Expanded(
              child: _NavigationItem(
                destination: destinations[index],
                selected: index == currentIndex,
                selectedBackgroundColor: selectedItemBackgroundColor,
                selectedForegroundColor: selectedItemForegroundColor,
                unselectedForegroundColor: unselectedItemForegroundColor,
                borderRadius: selectedItemBorderRadius,
                iconSize: iconSize,
                labelStyle: effectiveLabelStyle,
                padding: itemPadding,
                onTap: () => onDestinationSelected(index),
              ),
            ),
        ],
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        border: Border(top: BorderSide(color: effectiveBorderColor)),
        boxShadow: [
          BoxShadow(
            color: effectiveShadowColor,
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: safeAreaBottom ? SafeArea(top: false, child: navigation) : navigation,
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.destination,
    required this.selected,
    required this.selectedBackgroundColor,
    required this.selectedForegroundColor,
    required this.unselectedForegroundColor,
    required this.borderRadius,
    required this.iconSize,
    required this.labelStyle,
    required this.padding,
    required this.onTap,
  });

  final NavigationDestination destination;
  final bool selected;
  final Color selectedBackgroundColor;
  final Color selectedForegroundColor;
  final Color unselectedForegroundColor;
  final BorderRadius borderRadius;
  final double iconSize;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = selected ? selectedForegroundColor : unselectedForegroundColor;

    return Semantics(
      button: true,
      selected: selected,
      label: destination.label,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: selected ? selectedBackgroundColor : Colors.transparent,
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.micro),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconTheme.merge(
                  data: IconThemeData(color: foregroundColor, size: iconSize),
                  child: destination.icon,
                ),
                const SizedBox(height: AppSpacing.micro),
                Text(
                  destination.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle.copyWith(
                    color: foregroundColor,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
