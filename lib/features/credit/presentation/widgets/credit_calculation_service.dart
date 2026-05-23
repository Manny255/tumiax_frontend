
// lib/features/credit/domain/services/credit_calculation_service.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/localization/app_localizations.dart';

class CreditCalculationService {
  // =====================================================
  // INTEREST CALCULATION - 5% flat
  // =====================================================
  static double calculateInterest(double principal) {
    return principal * 0.05;
  }

  // =====================================================
  // FEE CALCULATION - Tiered flat fee (matches backend)
  // =====================================================
  static double calculateExternalTransferFee(double amount) {
    if (amount <= 10000) return 2000;
    if (amount <= 100000) return 3000;
    if (amount <= 500000) return 5000;
    return 10000;
  }

  // =====================================================
  // TOTAL TO REPAY
  // =====================================================
  static double calculateTotalToRepay({
    required double principal,
    double fee = 0,
  }) {
    final interest = calculateInterest(principal);
    return principal + interest + fee;
  }

  // =====================================================
  // FEE TIER DESCRIPTION (Localized)
  // =====================================================
  static String getFeeTierDescription(BuildContext context, double amount) {
    final t = AppLocalizations.of(context);

    if (amount <= 10000) {
      return t.translate('fee_tier_0_10k');
    } else if (amount <= 100000) {
      return t.translate('fee_tier_10k_100k');
    } else if (amount <= 500000) {
      return t.translate('fee_tier_100k_500k');
    } else {
      return t.translate('fee_tier_500k_plus');
    }
  }

  // =====================================================
  // GET FEE TIER KEY (for lookup without context)
  // =====================================================
  static String getFeeTierKey(double amount) {
    if (amount <= 10000) return 'fee_tier_0_10k';
    if (amount <= 100000) return 'fee_tier_10k_100k';
    if (amount <= 500000) return 'fee_tier_100k_500k';
    return 'fee_tier_500k_plus';
  }

  // =====================================================
  // FORMAT CURRENCY
  // =====================================================
  static String formatCurrency(double amount) {
    final currency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );
    return currency.format(amount);
  }

  // =====================================================
  // GET DUE DATE STRING
  // =====================================================
  static String getDueDateString(int daysFromNow) {
    final dueDate = DateTime.now().add(Duration(days: daysFromNow));
    return DateFormat('MMM dd, yyyy').format(dueDate);
  }

  // =====================================================
  // FORMAT DUE DATE WITH LOCALIZATION
  // =====================================================
  static String getDueDateWithLocalization(
    BuildContext context,
    int daysFromNow,
  ) {
    final t = AppLocalizations.of(context);
    final dateStr = getDueDateString(daysFromNow);
    return t.translate('due_date_format').replaceAll('{date}', dateStr);
  }
}
// // lib/features/credit/domain/services/credit_calculation_service.dart

// import 'package:intl/intl.dart';

// class CreditCalculationService {
//   // =====================================================
//   // INTEREST CALCULATION - 5% flat
//   // =====================================================
//   static double calculateInterest(double principal) {
//     return principal * 0.05;
//   }

//   // =====================================================
//   // FEE CALCULATION - Tiered flat fee (matches backend)
//   // =====================================================
//   static double calculateExternalTransferFee(double amount) {
//     if (amount <= 10000) return 2000;
//     if (amount <= 100000) return 3000;
//     if (amount <= 500000) return 5000;
//     return 10000;
//   }

//   // =====================================================
//   // TOTAL TO REPAY
//   // =====================================================
//   static double calculateTotalToRepay({
//     required double principal,
//     required double interest,
//     double fee = 0,
//   }) {
//     return principal + interest + fee;
//   }

//   // =====================================================
//   // FEE TIER DESCRIPTION
//   // =====================================================
//   static String getFeeTierDescription(double amount) {
//     if (amount <= 10000) return 'Up to 10,000 TZS = 2,000 TZS';
//     if (amount <= 100000) return '10,001 - 100,000 TZS = 3,000 TZS';
//     if (amount <= 500000) return '100,001 - 500,000 TZS = 5,000 TZS';
//     return 'Above 500,000 TZS = 10,000 TZS';
//   }

//   // =====================================================
//   // FORMAT CURRENCY
//   // =====================================================
//   static String formatCurrency(double amount) {
//     final currency = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );
//     return currency.format(amount);
//   }

//   // =====================================================
//   // GET DUE DATE STRING
//   // =====================================================
//   static String getDueDateString(int daysFromNow) {
//     final dueDate = DateTime.now().add(Duration(days: daysFromNow));
//     return DateFormat('MMM dd, yyyy').format(dueDate);
//   }
// }
