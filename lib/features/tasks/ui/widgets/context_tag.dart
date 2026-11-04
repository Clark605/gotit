import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';

/// ContextTag renders a pastel-tinted context badge per DESIGN.md.
///
/// Predefined contexts (Work, Home, Personal) have dedicated tint palettes.
/// Custom contexts map into peach, rose, yellow, or custom colorValues.
class ContextTag extends StatelessWidget {
  final String name;
  final int? colorValue;
  final VoidCallback? onTap;

  const ContextTag({
    super.key,
    required this.name,
    this.colorValue,
    this.onTap,
  });

  factory ContextTag.fromModel(ContextModel context, {VoidCallback? onTap}) {
    return ContextTag(
      name: context.name,
      colorValue: context.colorValue,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final (bg, text) = _resolveColors(name, colorValue, isDark);

    final content = Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.sm),
      child: Text(
        name,
        style: AppTypography.captionBold.copyWith(color: text, fontSize: 12),
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: content,
      );
    }
    return content;
  }

  static (Color, Color) _resolveColors(
    String name,
    int? colorValue,
    bool isDark,
  ) {
    if (colorValue != null) {
      final base = Color(colorValue);
      final bg = isDark
          ? base.withValues(alpha: 0.25)
          : base.withValues(alpha: 0.15);
      final text = isDark ? Colors.white : base;
      return (bg, text);
    }

    final lower = name.toLowerCase().trim();
    if (lower == 'work' || lower == 'العمل') {
      return isDark
          ? (AppColors.darkTintSky, AppColors.darkTintSkyText)
          : (AppColors.tintSky, AppColors.tintSkyText);
    } else if (lower == 'home' || lower == 'المنزل') {
      return isDark
          ? (AppColors.darkTintMint, AppColors.darkTintMintText)
          : (AppColors.tintMint, AppColors.tintMintText);
    } else if (lower == 'personal' || lower == 'شخصي') {
      return isDark
          ? (AppColors.darkTintLavender, AppColors.darkTintLavenderText)
          : (AppColors.tintLavender, AppColors.tintLavenderText);
    }

    // Default rotation for custom tags
    final hash = name.codeUnits.fold(0, (prev, elem) => prev + elem);
    final variant = hash % 3;
    switch (variant) {
      case 0:
        return isDark
            ? (AppColors.darkTintPeach, AppColors.darkTintPeachText)
            : (AppColors.tintPeach, AppColors.tintPeachText);
      case 1:
        return isDark
            ? (AppColors.darkTintRose, AppColors.darkTintRoseText)
            : (AppColors.tintRose, AppColors.tintRoseText);
      default:
        return isDark
            ? (AppColors.darkTintYellow, AppColors.darkTintYellowText)
            : (AppColors.tintYellow, AppColors.tintYellowText);
    }
  }
}
