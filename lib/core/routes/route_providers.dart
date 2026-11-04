import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotit/core/di/injection.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/routes/app_navigator.dart';
import 'package:gotit/core/routes/route_names.dart';
import 'package:gotit/core/storage/prefs_service.dart';
import 'package:gotit/core/widgets/screens/error_screen.dart';
import 'package:gotit/core/widgets/screens/maintenance_screen.dart';
import 'package:gotit/core/widgets/screens/no_internet_screen.dart';
import 'package:gotit/core/widgets/screens/not_found_screen.dart';
import 'package:gotit/core/widgets/screens/onboarding_screen.dart';
import 'package:gotit/core/widgets/screens/settings_screen.dart';
import 'package:gotit/core/widgets/screens/splash_screen.dart';
import 'package:gotit/core/widgets/screens/theme_gallery_screen.dart';
import 'package:gotit/core/widgets/screens/update_required_screen.dart';
import 'package:gotit/features/example/bloc/example_detail_bloc.dart';
import 'package:gotit/features/example/bloc/example_detail_event.dart';
import 'package:gotit/features/example/cubit/example_cubit.dart';
import 'package:gotit/features/example/ui/example_detail_args.dart';
import 'package:gotit/features/example/ui/example_detail_screen.dart';
import 'package:gotit/features/example/ui/example_screen.dart';
import 'package:gotit/features/tasks/cubit/task_form_cubit.dart';
import 'package:gotit/features/tasks/cubit/tasks_cubit.dart';
import 'package:gotit/features/tasks/ui/all_tasks_screen.dart';
import 'package:gotit/features/tasks/ui/task_detail_args.dart';
import 'package:gotit/features/tasks/ui/task_detail_screen.dart';
import 'package:gotit/features/tasks/ui/today_screen.dart';

Widget buildSplashRoute() => const SplashScreen();

Widget buildOnboardingRoute() => OnboardingScreen(
  onComplete: () async {
    final prefs = getIt<PrefsService>();
    await prefs.setHasSeenOnboarding(true);
    await AppNavigator.pushReplacementNamed(RouteNames.home);
  },
);

Widget buildSettingsRoute() => const SettingsScreen();

Widget buildThemeGalleryRoute() => const ThemeGalleryScreen();

Widget buildNotFoundRoute(String? routeName) =>
    NotFoundScreen(routeName: routeName);

Widget buildNoInternetRoute([VoidCallback? onRetry]) =>
    NoInternetScreen(onRetry: onRetry);

Widget buildMaintenanceRoute([VoidCallback? onRetry]) =>
    MaintenanceScreen(onRetry: onRetry);

Widget buildUpdateRequiredRoute([String updateUrl = '']) =>
    UpdateRequiredScreen(updateUrl: updateUrl);

Widget buildErrorRoute({
  Failure? failure,
  String? message,
  VoidCallback? onRetry,
}) => ErrorScreen(failure: failure, errorMessage: message, onRetry: onRetry);

Widget buildExampleRoute() => BlocProvider(
  create: (_) => getIt<ExampleCubit>()..loadItems(),
  child: const ExampleScreen(),
);

Widget buildTodayRoute() => MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => getIt<TasksCubit>()..initSubscriptions()),
    BlocProvider(create: (_) => getIt<TaskFormCubit>()),
  ],
  child: const TodayScreen(),
);

Widget buildAllTasksRoute() => MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => getIt<TasksCubit>()..initSubscriptions()),
    BlocProvider(create: (_) => getIt<TaskFormCubit>()),
  ],
  child: const AllTasksScreen(),
);

Widget buildTaskDetailRoute(Object? arguments) {
  final String? taskId = switch (arguments) {
    final TaskDetailArgs detailArgs => detailArgs.taskId,
    final String id => id,
    final Map<String, dynamic> map =>
      (map['id'] as String?) ?? (map['taskId'] as String?),
    _ => null,
  };

  if (taskId == null || taskId.isEmpty) {
    return buildNotFoundRoute(RouteNames.taskDetail);
  }

  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<TasksCubit>()..initSubscriptions()),
      BlocProvider(create: (_) => getIt<TaskFormCubit>()),
    ],
    child: TaskDetailScreen(taskId: taskId),
  );
}

Widget buildExampleDetailRoute(Object? arguments) {
  final int? itemId = switch (arguments) {
    final ExampleDetailArgs detailArgs => detailArgs.itemId,
    final int id => id,
    final String str => int.tryParse(str),
    final Map<String, dynamic> map =>
      (map['id'] as int?) ?? (map['itemId'] as int?),
    _ => null,
  };

  if (itemId == null || itemId <= 0) {
    return buildNotFoundRoute(RouteNames.exampleDetail);
  }

  return BlocProvider(
    create: (_) =>
        getIt<ExampleDetailBloc>()..add(ExampleDetailEvent.load(itemId)),
    child: ExampleDetailScreen(itemId: itemId),
  );
}
