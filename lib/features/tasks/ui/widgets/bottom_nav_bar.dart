import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

enum BottomNavTab { today, allTasks }

/// Bottom navigation bar with Today and Tasks tabs, 64dp height,
/// and 1px hairline top border per DESIGN.md.
class BottomNavBar extends StatelessWidget {
  final BottomNavTab currentTab;
  final ValueChanged<BottomNavTab> onTabSelected;

  const BottomNavBar({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    final bg = isDark ? AppColors.darkCanvas : AppColors.canvas;
    final hairlineColor = isDark ? AppColors.darkHairline : AppColors.hairline;
    final activeColor = isDark ? AppColors.darkAccent : AppColors.accent;
    final inactiveColor = isDark ? AppColors.darkSteel : AppColors.steel;

    return Container(
      decoration: BoxDecoration(
        color: bg,
        border: Border(top: BorderSide(color: hairlineColor, width: 1.0)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSpacing.bottomNavHeight,
          child: Row(
            children: [
              Expanded(
                child: _buildNavItem(
                  icon: Icons.calendar_today_outlined,
                  activeIcon: Icons.calendar_today,
                  label: l10n.todayTitle,
                  isSelected: currentTab == BottomNavTab.today,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                  onTap: () => onTabSelected(BottomNavTab.today),
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  icon: Icons.format_list_bulleted_outlined,
                  activeIcon: Icons.format_list_bulleted,
                  label: l10n.tasksTitle,
                  isSelected: currentTab == BottomNavTab.allTasks,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                  onTap: () => onTabSelected(BottomNavTab.allTasks),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isSelected,
    required Color activeColor,
    required Color inactiveColor,
    required VoidCallback onTap,
  }) {
    final color = isSelected ? activeColor : inactiveColor;
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isSelected ? activeIcon : icon, size: 22, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTypography.captionBold.copyWith(
              color: color,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
