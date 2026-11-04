import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/core/widgets/permission_status_badge.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ReminderTroubleshootingScreen extends StatefulWidget {
  const ReminderTroubleshootingScreen({super.key});

  @override
  State<ReminderTroubleshootingScreen> createState() =>
      _ReminderTroubleshootingScreenState();
}

class _ReminderTroubleshootingScreenState
    extends State<ReminderTroubleshootingScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);
    final canvas = isDark ? AppColors.darkCanvas : AppColors.canvas;

    return Scaffold(
      backgroundColor: canvas,
      appBar: AppBar(
        title: Text(
          l10n.troubleshootingTitle,
          style: AppTypography.title.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
          ),
        ),
        backgroundColor: canvas,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: AppSpacing.edgeInsetsPage,
          children: [
            // Diagnostics Card
            _buildDiagnosticsCard(context, l10n, isDark),
            AppSpacing.gapHLg,

            // OEM Guides Header
            Text(
              l10n.oemGuidesTitle,
              style: AppTypography.heading.copyWith(
                color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.oemGuidesSubtitle,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.slate,
              ),
            ),
            AppSpacing.gapHMd,

            // OEM Guides
            _buildOemTile(
              title: l10n.oemSamsungTitle,
              content: l10n.oemSamsungGuide,
              isDark: isDark,
            ),
            AppSpacing.gapHSm,
            _buildOemTile(
              title: l10n.oemXiaomiTitle,
              content: l10n.oemXiaomiGuide,
              isDark: isDark,
            ),
            AppSpacing.gapHSm,
            _buildOemTile(
              title: l10n.oemHuaweiTitle,
              content: l10n.oemHuaweiGuide,
              isDark: isDark,
            ),
            AppSpacing.gapHSm,
            _buildOemTile(
              title: l10n.oemOppoVivoTitle,
              content: l10n.oemOppoVivoGuide,
              isDark: isDark,
            ),
            AppSpacing.gapHLg,

            // DontKillMyApp Link
            Center(
              child: TextButton.icon(
                onPressed: () async {
                  final uri = Uri.parse('https://dontkillmyapp.com');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                icon: const Icon(Icons.open_in_new, size: 16),
                label: Text(
                  l10n.dontKillMyAppLink,
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? AppColors.darkAccent : AppColors.accent,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagnosticsCard(
    BuildContext context,
    AppLocalizations? l10n,
    bool isDark,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(
          color: isDark ? AppColors.darkHairline : AppColors.hairline,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.health_and_safety_outlined,
                size: 20,
                color: isDark ? AppColors.darkAccent : AppColors.accent,
              ),
              AppSpacing.gapWXs,
              Text(
                l10n?.systemDiagnosticsTitle ?? 'System Diagnostics',
                style: AppTypography.heading.copyWith(
                  color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildDiagnosticRow(
            title: l10n?.diagnosticNotifications ?? 'Notifications',
            status: PermissionBadgeStatus.active,
            isDark: isDark,
          ),
          Divider(
            color: isDark ? AppColors.darkHairline : AppColors.hairline,
            height: 16,
          ),
          _buildDiagnosticRow(
            title: l10n?.diagnosticExactAlarms ?? 'Exact Alarms',
            status: PermissionBadgeStatus.active,
            isDark: isDark,
          ),
          Divider(
            color: isDark ? AppColors.darkHairline : AppColors.hairline,
            height: 16,
          ),
          _buildDiagnosticRow(
            title: l10n?.diagnosticBatteryOptimizations ?? 'Battery Saver',
            status: PermissionBadgeStatus.restricted,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildDiagnosticRow({
    required String title,
    required PermissionBadgeStatus status,
    required bool isDark,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.bodySm.copyWith(
            color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
            fontWeight: FontWeight.w500,
          ),
        ),
        PermissionStatusBadge(status: status),
      ],
    );
  }

  Widget _buildOemTile({
    required String title,
    required String content,
    required bool isDark,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: AppRadius.md,
        border: Border.all(
          color: isDark ? AppColors.darkHairline : AppColors.hairline,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: isDark ? AppColors.darkAccent : AppColors.accent,
          collapsedIconColor: isDark ? AppColors.darkSteel : AppColors.steel,
          title: Text(
            title,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? AppColors.darkTextPrimary : AppColors.ink,
              fontWeight: FontWeight.w600,
            ),
          ),
          childrenPadding: const EdgeInsets.only(
            left: AppSpacing.md,
            right: AppSpacing.md,
            bottom: AppSpacing.md,
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                content,
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.slate,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
