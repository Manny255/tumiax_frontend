import '../../../core/localization/app_localizations.dart';

class TransferValidators {
  static String? validateAmount(String? value, AppLocalizations t) {
    if (value == null || value.isEmpty) {
      return t.translate('enter_amount');
    }

    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return t.translate('invalid_amount');
    }

    return null;
  }

  static String? validateEmail(String? value, AppLocalizations t) {
    if (value == null || value.isEmpty) {
      return t.translate('enter_email');
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return t.translate('invalid_email');
    }

    return null;
  }
}
