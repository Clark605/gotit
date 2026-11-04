import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/theme/app_theme.dart';
import 'package:gotit/features/tasks/ui/widgets/permission_primer_dialog.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

Widget _buildPrimerTestApp({
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
    home: const Scaffold(body: PermissionPrimerDialog()),
  );
}

void main() {
  group('PermissionPrimerDialog Visual & Interaction Tests', () {
    testWidgets('renders primer dialog in English Light mode', (tester) async {
      await tester.pumpWidget(_buildPrimerTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Stay On Top of Your Tasks'), findsOneWidget);
      expect(find.text('Enable Reminders'), findsOneWidget);
      expect(find.text('Maybe Later'), findsOneWidget);
      expect(
        find.text('Timely task notifications and lock screen quick actions'),
        findsOneWidget,
      );
      expect(
        find.text('Exact timing for high-priority reminders'),
        findsOneWidget,
      );
    });

    testWidgets('renders primer dialog in Dark mode', (tester) async {
      await tester.pumpWidget(_buildPrimerTestApp(theme: AppTheme.dark()));
      await tester.pumpAndSettle();

      expect(find.text('Stay On Top of Your Tasks'), findsOneWidget);
      expect(find.byIcon(Icons.notifications_active_outlined), findsOneWidget);
    });

    testWidgets('renders primer dialog in Arabic RTL', (tester) async {
      await tester.pumpWidget(_buildPrimerTestApp(locale: const Locale('ar')));
      await tester.pumpAndSettle();

      expect(find.text('ابقَ على اطلاع دائم بمهامك'), findsOneWidget);
      expect(find.text('تفعيل التذكيرات'), findsOneWidget);
      expect(find.text('ربما لاحقاً'), findsOneWidget);
    });
  });
}
