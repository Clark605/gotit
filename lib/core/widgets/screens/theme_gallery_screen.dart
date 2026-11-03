import 'package:flutter/material.dart';
import 'package:gotit/core/theme/app_colors_extension.dart';
import 'package:gotit/core/theme/app_radius.dart';
import 'package:gotit/core/theme/app_spacing.dart';
import 'package:gotit/core/theme/app_typography.dart';
import 'package:gotit/core/theme/dark_theme.dart';
import 'package:gotit/core/theme/light_theme.dart';

/// Temporary dev-only Theme Gallery screen to inspect and verify every
/// token and component in Light, Dark, LTR, and RTL modes.
class ThemeGalleryScreen extends StatefulWidget {
  const ThemeGalleryScreen({super.key});

  @override
  State<ThemeGalleryScreen> createState() => _ThemeGalleryScreenState();
}

class _ThemeGalleryScreenState extends State<ThemeGalleryScreen> {
  bool _isDark = false;
  bool _isRtl = false;
  double _textScale = 1.0;
  bool _taskChecked1 = false;
  bool _taskChecked2 = true;
  String _selectedFilterChip = 'All';

  @override
  Widget build(BuildContext context) {
    final activeTheme = _isDark
        ? buildDarkTheme(Locale(_isRtl ? 'ar' : 'en'))
        : buildLightTheme(Locale(_isRtl ? 'ar' : 'en'));

    return Theme(
      data: activeTheme,
      child: Builder(
        builder: (themedContext) {
          final colors = themedContext.appColors;

          return Directionality(
            textDirection: _isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: MediaQuery(
              data: MediaQuery.of(
                themedContext,
              ).copyWith(textScaler: TextScaler.linear(_textScale)),
              child: Scaffold(
                backgroundColor: colors.canvas,
                appBar: AppBar(
                  title: Text(
                    _isRtl ? 'معرض التصميم (Gotit)' : 'Gotit Theme Gallery',
                  ),
                  actions: [
                    IconButton(
                      tooltip: _isRtl ? 'Switch to LTR' : 'Switch to RTL',
                      icon: Icon(
                        _isRtl
                            ? Icons.format_textdirection_l_to_r
                            : Icons.format_textdirection_r_to_l,
                      ),
                      onPressed: () => setState(() => _isRtl = !_isRtl),
                    ),
                    IconButton(
                      tooltip: _isDark ? 'Light Mode' : 'Dark Mode',
                      icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
                      onPressed: () => setState(() => _isDark = !_isDark),
                    ),
                    PopupMenuButton<double>(
                      tooltip: 'Text Scale',
                      icon: const Icon(Icons.format_size),
                      onSelected: (scale) => setState(() => _textScale = scale),
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 1.0, child: Text('100% Scale')),
                        PopupMenuItem(value: 1.5, child: Text('150% Scale')),
                        PopupMenuItem(
                          value: 2.0,
                          child: Text('200% Scale (A11y)'),
                        ),
                      ],
                    ),
                  ],
                ),
                body: ListView(
                  padding: AppSpacing.edgeInsetsPage,
                  children: [
                    _buildModeSummaryBanner(colors),
                    AppSpacing.gapHXl,

                    // 1. Color Tokens
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'رموز الألوان' : '1. Color Tokens',
                    ),
                    AppSpacing.gapHSm,
                    _buildColorGrid(colors),
                    AppSpacing.gapHXl,

                    // 2. Context Tints & Tags
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'وسوم السياق' : '2. Context Tints & Tags',
                    ),
                    AppSpacing.gapHSm,
                    _buildContextTagsSection(colors),
                    AppSpacing.gapHXl,

                    // 3. Typography
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'سلم الطباعة' : '3. Typography Scale',
                    ),
                    AppSpacing.gapHSm,
                    _buildTypographySection(themedContext),
                    AppSpacing.gapHXl,

                    // 4. Buttons
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'الأزرار' : '4. Button Components',
                    ),
                    AppSpacing.gapHSm,
                    _buildButtonsSection(themedContext),
                    AppSpacing.gapHXl,

                    // 5. Text Inputs
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'حقول الإدخال' : '5. Text Inputs',
                    ),
                    AppSpacing.gapHSm,
                    _buildInputsSection(themedContext),
                    AppSpacing.gapHXl,

                    // 6. Chips & Filters
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'شرائح التصفية' : '6. Filter Chips',
                    ),
                    AppSpacing.gapHSm,
                    _buildFilterChipsSection(themedContext),
                    AppSpacing.gapHXl,

                    // 7. Task Rows & Checkboxes
                    _buildSectionTitle(
                      themedContext,
                      _isRtl
                          ? 'صفوف المهام ومربعات الاختيار'
                          : '7. Task Rows & Checkboxes',
                    ),
                    AppSpacing.gapHSm,
                    _buildTaskRowsSection(themedContext, colors),
                    AppSpacing.gapHXl,

                    // 8. Overdue & Section Headers
                    _buildSectionTitle(
                      themedContext,
                      _isRtl
                          ? 'ترويسات الأقسام والتنبيهات'
                          : '8. Section Headers & Warning',
                    ),
                    AppSpacing.gapHSm,
                    _buildSectionHeaders(themedContext, colors),
                    AppSpacing.gapHXl,

                    // 9. Overlays (Bottom Sheet & Snackbar)
                    _buildSectionTitle(
                      themedContext,
                      _isRtl
                          ? 'الطبقات والقوائم السفلية'
                          : '9. Overlays & Sheets',
                    ),
                    AppSpacing.gapHSm,
                    _buildOverlaysSection(themedContext, colors),
                    AppSpacing.gapHXl,

                    // 10. Bottom Navigation Bar Preview
                    _buildSectionTitle(
                      themedContext,
                      _isRtl
                          ? 'شريط التنقل السفلي'
                          : '10. Bottom Navigation (64px)',
                    ),
                    AppSpacing.gapHSm,
                    _buildBottomNavPreview(themedContext, colors),
                    AppSpacing.gapHXl,

                    // 11. Empty State Preview
                    _buildSectionTitle(
                      themedContext,
                      _isRtl ? 'الحالة الفارغة' : '11. Empty State',
                    ),
                    AppSpacing.gapHSm,
                    _buildEmptyStatePreview(themedContext, colors),
                    AppSpacing.gapHXxl,
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildModeSummaryBanner(AppColorsExtension colors) {
    return Container(
      padding: AppSpacing.edgeInsetsAllMd,
      decoration: BoxDecoration(
        color: colors.surfaceRaised,
        borderRadius: AppRadius.md,
        border: Border.all(color: colors.hairlineStrong),
      ),
      child: Row(
        children: [
          Icon(Icons.palette_outlined, color: colors.accent, size: 28),
          AppSpacing.gapWMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isDark
                      ? 'Dark Theme (Verified)'
                      : 'Light Theme (Paper Minimal)',
                  style: AppTypography.heading.copyWith(color: colors.ink),
                ),
                Text(
                  'Direction: ${_isRtl ? "RTL (Arabic)" : "LTR (English)"} | Text Scale: ${(_textScale * 100).toInt()}%',
                  style: AppTypography.bodySm.copyWith(color: colors.slate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final colors = context.appColors;
    return Text(title, style: AppTypography.title.copyWith(color: colors.ink));
  }

  Widget _buildColorGrid(AppColorsExtension colors) {
    final swatches = [
      ('accent', colors.accent, colors.onAccent),
      ('accent-pressed', colors.accentPressed, colors.onAccent),
      ('accent-soft', colors.accentSoft, colors.ink),
      ('canvas', colors.canvas, colors.ink),
      ('surface', colors.surface, colors.ink),
      ('surface-raised', colors.surfaceRaised, colors.ink),
      ('hairline', colors.hairline, colors.ink),
      ('hairline-strong', colors.hairlineStrong, colors.ink),
      ('ink', colors.ink, colors.canvas),
      ('charcoal', colors.charcoal, colors.canvas),
      ('slate', colors.slate, colors.canvas),
      ('steel', colors.steel, colors.canvas),
      ('muted', colors.muted, colors.ink),
      ('warning', colors.warning, colors.canvas),
      ('error', colors.error, colors.onAccent),
    ];

    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: swatches.map((s) {
        return Container(
          width: 105,
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: s.$2,
            borderRadius: AppRadius.sm,
            border: Border.all(color: colors.hairlineStrong, width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.$1,
                style: AppTypography.captionBold.copyWith(
                  color: s.$3,
                  fontSize: 11,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '#${s.$2.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
                style: AppTypography.caption.copyWith(
                  color: s.$3,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContextTagsSection(AppColorsExtension colors) {
    final tags = [
      ('Work (Sky)', colors.tintSky, colors.tintSkyText),
      ('Home (Mint)', colors.tintMint, colors.tintMintText),
      ('Personal (Lavender)', colors.tintLavender, colors.tintLavenderText),
      ('Custom (Peach)', colors.tintPeach, colors.tintPeachText),
      ('Custom (Rose)', colors.tintRose, colors.tintRoseText),
      ('Custom (Yellow)', colors.tintYellow, colors.tintYellowText),
    ];

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: tags.map((t) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: t.$2, borderRadius: AppRadius.sm),
          child: Text(
            t.$1,
            style: AppTypography.captionBold.copyWith(color: t.$3),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTypographySection(BuildContext context) {
    final colors = context.appColors;

    final samples = [
      (
        'screen-title',
        '28px / 600 / 1.25',
        AppTypography.screenTitle,
        'Today • المهام اليومية',
      ),
      (
        'title',
        '22px / 600 / 1.30',
        AppTypography.title,
        'Task Details • تفاصيل المهمة',
      ),
      (
        'heading',
        '18px / 600 / 1.40',
        AppTypography.heading,
        'Group Section • مجموعة العمل',
      ),
      (
        'body',
        '16px / 400 / 1.60',
        AppTypography.body,
        'Notes and descriptions • ملاحظات وتفاصيل',
      ),
      (
        'body-medium',
        '16px / 500 / 1.60',
        AppTypography.bodyMedium,
        'Task Row Title • عنوان المهمة في القائمة',
      ),
      (
        'body-sm',
        '14px / 400 / 1.55',
        AppTypography.bodySm,
        'Due tomorrow, 5:00 PM • موعد الإنجاز غداً',
      ),
      (
        'caption',
        '13px / 400 / 1.45',
        AppTypography.caption,
        'Created 2 hours ago • تم الإنشاء قبل ساعتين',
      ),
      (
        'caption-bold',
        '13px / 600 / 1.45',
        AppTypography.captionBold,
        'SECTION HEADER • ترويسة القسم',
      ),
      (
        'button',
        '15px / 500 / 1.30',
        AppTypography.button,
        'Save Changes • حفظ التغييرات',
      ),
    ];

    return Container(
      padding: AppSpacing.edgeInsetsAllMd,
      decoration: BoxDecoration(
        color: colors.surfaceRaised,
        borderRadius: AppRadius.md,
        border: Border.all(color: colors.hairline),
      ),
      child: Column(
        children: samples.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.$1,
                      style: AppTypography.captionBold.copyWith(
                        color: colors.steel,
                      ),
                    ),
                    Text(
                      item.$2,
                      style: AppTypography.caption.copyWith(
                        color: colors.muted,
                      ),
                    ),
                  ],
                ),
                AppSpacing.gapHXxs,
                Text(item.$4, style: item.$3.copyWith(color: colors.ink)),
                const Divider(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            _isRtl ? 'زر أساسي (حفظ المهمة)' : 'Primary Button (Save Task)',
          ),
        ),
        AppSpacing.gapHSm,
        const ElevatedButton(
          onPressed: null,
          child: Text('Primary Button (Disabled)'),
        ),
        AppSpacing.gapHSm,
        OutlinedButton(
          onPressed: () {},
          child: Text(
            _isRtl ? 'زر ثانوي (إلغاء)' : 'Secondary Button (Cancel)',
          ),
        ),
        AppSpacing.gapHSm,
        TextButton(
          onPressed: () {},
          child: Text(
            _isRtl ? 'زر شبحي (خيارات متقدمة)' : 'Ghost Button (Advanced)',
          ),
        ),
      ],
    );
  }

  Widget _buildInputsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: _isRtl ? 'اكتب عنوان المهمة...' : 'Write task title...',
          ),
        ),
        AppSpacing.gapHMd,
        TextField(
          decoration: InputDecoration(
            hintText: _isRtl ? 'حقل به خطأ' : 'Field with error',
            errorText: _isRtl ? 'عنوان المهمة مطلوب' : 'Title cannot be empty',
          ),
        ),
        AppSpacing.gapHMd,
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: _isRtl ? 'أضف ملاحظة للمهمة...' : 'Add notes to task...',
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChipsSection(BuildContext context) {
    final chips = ['All', 'Work', 'Home', 'Overdue'];
    return Wrap(
      spacing: AppSpacing.sm,
      children: chips.map((c) {
        final isSelected = _selectedFilterChip == c;
        return FilterChip(
          label: Text(c),
          selected: isSelected,
          onSelected: (_) => setState(() => _selectedFilterChip = c),
        );
      }).toList(),
    );
  }

  Widget _buildTaskRowsSection(
    BuildContext context,
    AppColorsExtension colors,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.canvas,
        border: Border.all(color: colors.hairline),
        borderRadius: AppRadius.md,
      ),
      child: Column(
        children: [
          // Active Task Row
          InkWell(
            onTap: () => setState(() => _taskChecked1 = !_taskChecked1),
            child: Container(
              height: AppSpacing.rowMinHeight,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: AppSpacing.touchTarget,
                    height: AppSpacing.touchTarget,
                    child: Center(
                      child: Checkbox(
                        value: _taskChecked1,
                        onChanged: (val) =>
                            setState(() => _taskChecked1 = val ?? false),
                      ),
                    ),
                  ),
                  AppSpacing.gapWSm,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isRtl
                              ? 'تسليم تقرير مراجعة الكود'
                              : 'Submit design review report',
                          style: AppTypography.bodyMedium.copyWith(
                            color: _taskChecked1 ? colors.muted : colors.ink,
                            decoration: _taskChecked1
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              _isRtl ? 'اليوم · 2:00 م' : 'Today · 2:00 PM',
                              style: AppTypography.bodySm.copyWith(
                                color: colors.slate,
                              ),
                            ),
                            AppSpacing.gapWSm,
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: colors.tintSky,
                                borderRadius: AppRadius.sm,
                              ),
                              child: Text(
                                'Work',
                                style: AppTypography.captionBold.copyWith(
                                  color: colors.tintSkyText,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),

          // Overdue Task Row
          Container(
            height: AppSpacing.rowMinHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: AppSpacing.touchTarget,
                  height: AppSpacing.touchTarget,
                  child: Center(
                    child: Checkbox(value: false, onChanged: (_) {}),
                  ),
                ),
                AppSpacing.gapWSm,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _isRtl
                            ? 'تجديد اشتراك السحابة'
                            : 'Renew cloud infrastructure',
                        style: AppTypography.bodyMedium.copyWith(
                          color: colors.ink,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            size: 14,
                            color: colors.warning,
                          ),
                          AppSpacing.gapWXxs,
                          Text(
                            _isRtl ? 'متأخر منذ الأمس' : 'Overdue · Yesterday',
                            style: AppTypography.bodySm.copyWith(
                              color: colors.warning,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Completed Task Row (With soft accent wash)
          Container(
            height: AppSpacing.rowMinHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            color: colors.accentSoft.withValues(alpha: 0.35),
            child: Row(
              children: [
                SizedBox(
                  width: AppSpacing.touchTarget,
                  height: AppSpacing.touchTarget,
                  child: Center(
                    child: Checkbox(
                      value: _taskChecked2,
                      onChanged: (val) =>
                          setState(() => _taskChecked2 = val ?? false),
                    ),
                  ),
                ),
                AppSpacing.gapWSm,
                Expanded(
                  child: Text(
                    _isRtl
                        ? 'شراء قهوة للمكتب'
                        : 'Buy paper notebooks for team',
                    style: AppTypography.bodyMedium.copyWith(
                      color: colors.muted,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeaders(BuildContext context, AppColorsExtension colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            _isRtl ? 'اليوم · ٣' : 'Due today · 3',
            style: AppTypography.captionBold.copyWith(color: colors.steel),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            _isRtl ? 'متأخرة · ٢' : 'Overdue · 2',
            style: AppTypography.captionBold.copyWith(color: colors.warning),
          ),
        ),
      ],
    );
  }

  Widget _buildOverlaysSection(
    BuildContext context,
    AppColorsExtension colors,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (sheetContext) {
                  return Container(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isRtl
                              ? 'قائمة سفلية (نصف قطر ٢٠)'
                              : 'Bottom Sheet (20px radius)',
                          style: AppTypography.title.copyWith(
                            color: colors.ink,
                          ),
                        ),
                        AppSpacing.gapHSm,
                        Text(
                          _isRtl
                              ? 'تعتمد القوائم السفلية على السطح المرتفع surface-raised وظل المستوى ٢.'
                              : 'Sheets use surface-raised background and Level-2 elevation with top 20px corners.',
                          style: AppTypography.body.copyWith(
                            color: colors.charcoal,
                          ),
                        ),
                        AppSpacing.gapHLg,
                        ElevatedButton(
                          onPressed: () => Navigator.pop(sheetContext),
                          child: Text(_isRtl ? 'إغلاق' : 'Close Sheet'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text(_isRtl ? 'معاينة القائمة' : 'Preview Bottom Sheet'),
          ),
        ),
        AppSpacing.gapWMd,
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_isRtl ? 'تم حذف المهمة' : 'Task deleted'),
                  action: SnackBarAction(
                    label: _isRtl ? 'تراجع' : 'Undo',
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: Text(_isRtl ? 'إظهار التنبيه' : 'Preview SnackBar'),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavPreview(
    BuildContext context,
    AppColorsExtension colors,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: colors.canvas,
        border: Border(top: BorderSide(color: colors.hairline, width: 1)),
      ),
      child: NavigationBar(
        selectedIndex: 0,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.calendar_today_outlined),
            selectedIcon: const Icon(Icons.calendar_today),
            label: _isRtl ? 'اليوم' : 'Today',
          ),
          NavigationDestination(
            icon: const Icon(Icons.check_circle_outline),
            selectedIcon: const Icon(Icons.check_circle),
            label: _isRtl ? 'المهام' : 'Tasks',
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStatePreview(
    BuildContext context,
    AppColorsExtension colors,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.lg,
        border: Border.all(color: colors.hairline),
      ),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: colors.steel),
          AppSpacing.gapHMd,
          Text(
            _isRtl ? 'لا توجد مهام اليوم' : 'No tasks for today',
            style: AppTypography.title.copyWith(color: colors.ink),
          ),
          AppSpacing.gapHXs,
          Text(
            _isRtl
                ? 'استمتع بوقتك أو أضف مهمة جديدة من زر الإضافة'
                : 'Enjoy your quiet day or add a task below',
            style: AppTypography.bodySm.copyWith(color: colors.slate),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
