import 'package:flutter/material.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/l10n/l10n_extension.dart';
import 'package:gotit/core/routes/app_navigator.dart';
import 'package:gotit/core/routes/route_names.dart';
import 'package:gotit/core/widgets/app_error_state.dart';

class ErrorScreen extends StatelessWidget {
  final Failure? failure;
  final String? errorMessage;
  final VoidCallback? onRetry;

  const ErrorScreen({super.key, this.failure, this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.error),
        leading: AppNavigator.canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => AppNavigator.pop(),
              )
            : null,
      ),
      body: AppErrorState(
        failure: failure,
        errorMessage: errorMessage,
        onRetry:
            onRetry ??
            () {
              AppNavigator.pushNamedAndRemoveUntil(
                RouteNames.home,
                (route) => false,
              );
            },
      ),
    );
  }
}
