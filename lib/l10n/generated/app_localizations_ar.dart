// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Gotit';

  @override
  String get ok => 'حسناً';

  @override
  String get cancel => 'إلغاء';

  @override
  String get save => 'حفظ';

  @override
  String get delete => 'حذف';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get continueLabel => 'متابعة';

  @override
  String get done => 'تم';

  @override
  String get close => 'إغلاق';

  @override
  String get search => 'بحث';

  @override
  String get refresh => 'تحديث';

  @override
  String get error => 'خطأ';

  @override
  String get success => 'نجاح';

  @override
  String get warning => 'تنبيه';

  @override
  String get info => 'معلومات';

  @override
  String get loading => 'جارٍ التحميل...';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get themeMode => 'المظهر';

  @override
  String get themeSystem => 'مظهر النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get appVersion => 'الإصدار';

  @override
  String get about => 'حول التطبيق';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get noInternetTitle => 'لا يوجد اتصال بالإنترنت';

  @override
  String get noInternetMessage =>
      'يرجى التحقق من اتصالك بالإنترنت والمحاولة مجدداً.';

  @override
  String get offlineBannerText =>
      'أنت غير متصل بالإنترنت حالياً. قد لا تتوفر بعض الميزات.';

  @override
  String get backOnlineText => 'تمت استعادة الاتصال بالإنترنت.';

  @override
  String get tryAgain => 'إعادة المحاولة';

  @override
  String get updateRequiredTitle => 'تحديث إلزامي';

  @override
  String get updateRequiredMessage =>
      'يتوفر إصدار جديد من التطبيق. يرجى التحديث للمتابعة.';

  @override
  String get updateNow => 'تحديث الآن';

  @override
  String get copyUpdateLink => 'نسخ رابط التحديث';

  @override
  String get linkCopied => 'تم نسخ الرابط إلى الحافظة.';

  @override
  String get maintenanceTitle => 'تحت الصيانة';

  @override
  String get maintenanceMessage =>
      'النظام يخضع للصيانة الدورية حالياً. يرجى المحاولة لاحقاً.';

  @override
  String get errorNetwork =>
      'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة والمحاولة مرة أخرى.';

  @override
  String get errorTimeout => 'انتهت مهلة الاتصال. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnauthorized =>
      'مطلوب تسجيل الدخول. يرجى تسجيل الدخول مجدداً.';

  @override
  String get errorForbidden => 'ليس لديك الصلاحية لتنفيذ هذا الإجراء.';

  @override
  String get errorNotFound => 'لم يتم العثور على العنصر المطلوب.';

  @override
  String get errorConflict =>
      'حدث تعارض مع الحالة الحالية للمورد. يرجى التحديث والمحاولة مرة أخرى.';

  @override
  String get errorValidation => 'البيانات المدخلة غير صالحة.';

  @override
  String get errorServer => 'حدث خطأ في الخادم. يرجى المحاولة في وقت لاحق.';

  @override
  String get errorCancelled => 'تم إلغاء العملية.';

  @override
  String get errorUnknown => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';

  @override
  String get exampleTitle => 'العناصر المرجعية';

  @override
  String get exampleSubtitle => 'نموذج مرجعي للبنية المعمارية النظيفة';

  @override
  String get exampleEmptyTitle => 'لا توجد عناصر حتى الآن';

  @override
  String get exampleEmptyMessage =>
      'اسحب للأسفل للتحديث وتحميل العناصر من الخدمة.';

  @override
  String get exampleLoadMore => 'جارٍ تحميل المزيد...';

  @override
  String exampleItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عنصر',
      many: '$count عنصراً',
      few: '$count عناصر',
      two: 'عنصران',
      one: 'عنصر واحد',
      zero: 'لا توجد عناصر',
    );
    return '$_temp0';
  }

  @override
  String get exampleCreateTitle => 'عنصر جديد';

  @override
  String get exampleItemTitleLabel => 'العنوان';

  @override
  String get exampleItemBodyLabel => 'الوصف';

  @override
  String get exampleItemCreated => 'تم إنشاء العنصر بنجاح';

  @override
  String get notFoundRouteTitle => 'الصفحة غير موجودة';

  @override
  String get notFoundRouteMessage => 'الصفحة المطلوبة غير موجودة أو تم نقلها.';

  @override
  String get goToHome => 'العودة للرئيسية';

  @override
  String get onboardingTitle1 => 'قالب انطلاق بمعايير الإنتاج';

  @override
  String get onboardingDesc1 =>
      'مبني باستخدام Flutter BLoC و Freezed وبنية معمارية صارمة ورموز تصميم واضحة.';

  @override
  String get onboardingTitle2 => 'دعم كامل للغة العربية والإنجليزية';

  @override
  String get onboardingDesc2 =>
      'تجربة مستخدم كاملة من اليمين إلى اليسار مع خطوط IBM Plex Sans Arabic و Inter.';

  @override
  String get onboardingTitle3 => 'جاهز للإطلاق الفوري';

  @override
  String get onboardingDesc3 =>
      'بيئات متعددة، وإجراءات محمية، وخطوط بناء مؤتمتة بدون الحاجة لحسابات خارجية.';

  @override
  String get skip => 'تخطي';

  @override
  String get getStarted => 'ابدأ الآن';

  @override
  String get todayNav => 'اليوم';

  @override
  String get tasksNav => 'المهام';

  @override
  String get todayTitle => 'اليوم';

  @override
  String get overdueSection => 'المتأخرة';

  @override
  String get dueTodaySection => 'اليوم';

  @override
  String get startTodaySection => 'البدء اليوم';

  @override
  String get allClearTitle => 'لا توجد مهام متبقية لليوم';

  @override
  String get allClearSubtitle => 'خذ قسطاً من الراحة أو خطط للمستقبل.';

  @override
  String get addTask => 'إضافة مهمة';

  @override
  String get tasksTitle => 'المهام';

  @override
  String get activeStatus => 'النشطة';

  @override
  String get completedStatus => 'المكتملة';

  @override
  String get allStatus => 'الكل';

  @override
  String get allContexts => 'الكل';

  @override
  String get newContext => '+ جديد';

  @override
  String get dailyMomentum => 'إنجاز اليوم';

  @override
  String completedRatio(int completed, int total, int percent) {
    return '$completed من $total مكتملة ($percent%)';
  }

  @override
  String get noTasksInContext => 'لا توجد مهام في هذا التصنيف.';

  @override
  String get taskDetailTitle => 'تفاصيل المهمة';

  @override
  String get checklistTitle => 'قائمة المهام الفرعية';

  @override
  String checklistProgress(int completed, int total) {
    return '$completed من $total مكتملة';
  }

  @override
  String estimatedEffort(String effort) {
    return 'الجهد المقدر: $effort';
  }

  @override
  String get notesTitle => 'الملاحظات';

  @override
  String get deleteTaskConfirmTitle => 'حذف هذه المهمة؟';

  @override
  String get deleteTaskConfirmMessage =>
      'سيؤدي هذا إلى إزالة المهمة وجميع عناصرها الفرعية.';

  @override
  String get undo => 'تراجع';

  @override
  String get taskDeleted => 'تم حذف المهمة';

  @override
  String get newTaskTitle => 'مهمة جديدة';

  @override
  String get editTaskTitle => 'تعديل المهمة';

  @override
  String get taskTitleLabel => 'العنوان';

  @override
  String get taskTitleHint => 'عنوان المهمة';

  @override
  String get titleRequiredError => 'لا يمكن ترك العنوان فارغاً';

  @override
  String get scheduleLabel => 'الموعد';

  @override
  String get allDay => 'طوال اليوم';

  @override
  String get contextLabel => 'التصنيف';

  @override
  String get effortEstimateLabel => 'الجهد المقدر';

  @override
  String get notesHint => 'أضف ملاحظات أو تفاصيل...';

  @override
  String get addChecklistItem => 'إضافة عنصر فرعي';

  @override
  String get saveTask => 'حفظ المهمة';

  @override
  String get manageContextsTitle => 'إدارة التصنيفات';

  @override
  String get contextNameHint => 'اسم التصنيف (مثل: المالية، الصحة)';

  @override
  String get addContext => 'إضافة تصنيف';

  @override
  String get contextAlreadyExists => 'هذا التصنيف موجود بالفعل';

  @override
  String deleteContextConfirmTitle(String name) {
    return 'حذف \"$name\"؟';
  }

  @override
  String get deleteContextConfirmMessage =>
      'سيتم الاحتفاظ بالمهام المرتبطة بهذا التصنيف وتعيينها كـ \"بدون تصنيف\".';

  @override
  String get noContext => 'بدون تصنيف';

  @override
  String get defaultContext => 'افتراضي';

  @override
  String get contextWork => 'العمل';

  @override
  String get contextHome => 'المنزل';

  @override
  String get contextPersonal => 'شخصي';
}
