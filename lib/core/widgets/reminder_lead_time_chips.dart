import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

class ReminderLeadTimeOption {
  final int minutes;
  final String Function(AppLocalizations l10n) labelBuilder;

  const ReminderLeadTimeOption({
    required this.minutes,
    required this.labelBuilder,
  });
}

class ReminderLeadTimeChips extends StatelessWidget {
  final int selectedMinutes;
  final ValueChanged<int> onSelected;
  final bool enabled;

  static const List<ReminderLeadTimeOption> options = [
    ReminderLeadTimeOption(minutes: 0, labelBuilder: _labelAtDue),
    ReminderLeadTimeOption(minutes: 5, labelBuilder: _label5m),
    ReminderLeadTimeOption(minutes: 15, labelBuilder: _label15m),
    ReminderLeadTimeOption(minutes: 30, labelBuilder: _label30m),
    ReminderLeadTimeOption(minutes: 60, labelBuilder: _label1h),
    ReminderLeadTimeOption(minutes: 1440, labelBuilder: _label1d),
  ];

  static String _labelAtDue(AppLocalizations l) => l.reminderLeadAtDue;
  static String _label5m(AppLocalizations l) => l.reminderLead5m;
  static String _label15m(AppLocalizations l) => l.reminderLead15m;
  static String _label30m(AppLocalizations l) => l.reminderLead30m;
  static String _label1h(AppLocalizations l) => l.reminderLead1h;
  static String _label1d(AppLocalizations l) => l.reminderLead1d;

  const ReminderLeadTimeChips({
    super.key,
    required this.selectedMinutes,
    required this.onSelected,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: options.map((option) {
          final isSelected = option.minutes == selectedMinutes;
          final label = option.labelBuilder(l10n);

          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: Semantics(
              button: true,
              selected: isSelected,
              enabled: enabled,
              label: label,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: enabled ? () => onSelected(option.minutes) : null,
                  borderRadius: AppRadius.full,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeOut,
                    constraints: const BoxConstraints(
                      minHeight: AppSpacing.minTouchTarget,
                      minWidth: 48,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isDark
                                ? AppColors.darkAccentSoft
                                : AppColors.accentSoft)
                          : (isDark
                                ? AppColors.darkSurface
                                : AppColors.surface),
                      borderRadius: AppRadius.full,
                      border: Border.all(
                        color: isSelected
                            ? (isDark ? AppColors.darkAccent : AppColors.accent)
                            : (isDark
                                  ? AppColors.darkHairline
                                  : AppColors.hairline),
                        width: isSelected ? 1.5 : 1.0,
                      ),
                    ),
                    child: Text(
                      label,
                      style: AppTypography.caption.copyWith(
                        color: isSelected
                            ? (isDark ? AppColors.darkAccent : AppColors.accent)
                            : (isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.slate),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
