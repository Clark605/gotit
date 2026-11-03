import 'package:flutter/material.dart';
import 'package:gotit/l10n/generated/app_localizations.dart';

extension LocalizationContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
