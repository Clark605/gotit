import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/core/widgets/permission_status_badge.dart';
import 'package:gotit/features/tasks/ui/reminder_troubleshooting_screen.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildTroubleshootingTestApp({
  ThemeData? theme,
  Locale locale = const Locale('en'),
}) {
  return MaterialApp(
    theme: theme ?? AppTheme.light(),
    locale: locale,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('en'), Locale('ar')],
    home: const ReminderTroubleshootingScreen(),
  );
}

void main() {
  group('ReminderTroubleshootingScreen Visual & Interaction Tests', () {
    testWidgets('renders diagnostics and OEM guides in English Light', (
      tester,
    ) async {
      await tester.pumpWidget(_buildTroubleshootingTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Reminder Reliability'), findsOneWidget);
      expect(find.text('System Diagnostics'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Exact Alarms'), findsOneWidget);
      expect(find.text('Battery Saver'), findsOneWidget);
      expect(find.byType(PermissionStatusBadge), findsNWidgets(3));

      expect(find.text('Device-Specific Settings'), findsOneWidget);
      expect(find.text('Samsung (One UI)'), findsOneWidget);
      expect(find.text('Xiaomi / HyperOS / MIUI'), findsOneWidget);
      expect(find.text('Huawei (EMUI)'), findsOneWidget);
      expect(find.text('OPPO / Vivo / OnePlus'), findsOneWidget);

      // Expand Samsung tile
      await tester.tap(find.text('Samsung (One UI)'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Unrestricted'), findsOneWidget);
    });

    testWidgets('renders troubleshooting screen in Dark mode', (tester) async {
      await tester.pumpWidget(
        _buildTroubleshootingTestApp(theme: AppTheme.dark()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Reminder Reliability'), findsOneWidget);
      expect(find.byType(PermissionStatusBadge), findsNWidgets(3));
    });

    testWidgets('renders troubleshooting screen in Arabic RTL', (tester) async {
      await tester.pumpWidget(
        _buildTroubleshootingTestApp(locale: const Locale('ar')),
      );
      await tester.pumpAndSettle();

      expect(find.text('موثوقية التذكيرات'), findsOneWidget);
      expect(find.text('تشخيص النظام'), findsOneWidget);
      expect(find.text('الإشعارات'), findsOneWidget);
      expect(find.text('التنبيهات الدقيقة'), findsOneWidget);
    });
  });
}
