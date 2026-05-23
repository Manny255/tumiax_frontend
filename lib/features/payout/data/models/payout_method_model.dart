import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/entities/payout_method.dart';

part 'payout_method_model.freezed.dart';
part 'payout_method_model.g.dart';

@freezed
sealed class PayoutMethodModel with _$PayoutMethodModel {
  const factory PayoutMethodModel({
    required int id,

    /// "BT" or "Mo"
    required String method,

    // =========================
    // BANK FIELDS
    // =========================

    @JsonKey(name: 'bank_name')
    String? bankName,

    @JsonKey(name: 'account_number')
    String? accountNumber,

    @JsonKey(name: 'account_holder')
    String? accountHolder,

    @JsonKey(name: 'account_currency')
    String? accountCurrency,

    @JsonKey(name: 'swift_code')
    String? swiftCode,

    @JsonKey(name: 'routing_number')
    String? routingNumber,

    String? iban,

    // =========================
    // MOBILE WALLET FIELDS
    // =========================

    @JsonKey(name: 'mobile_wallet_number')
    String? mobileWalletNumber,

    @JsonKey(name: 'mobile_wallet_provider')
    String? mobileWalletProvider,

    @JsonKey(name: 'mobile_wallet_name')
    String? mobileWalletName,

    // =========================
    // STATUS FIELDS
    // =========================

    @JsonKey(name: 'is_active')
    required bool isActive,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'active_from')
    DateTime? activeFrom,
  }) = _PayoutMethodModel;

  factory PayoutMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PayoutMethodModelFromJson(json);
}

extension PayoutMethodMapper on PayoutMethodModel {
  PayoutMethod toEntity() {
    return PayoutMethod(
      id: id,
      method: method,
      bankName: bankName,
      accountNumber: accountNumber,
      accountHolder: accountHolder,
      accountCurrency: accountCurrency,
      swiftCode: swiftCode,
      routingNumber: routingNumber,
      iban: iban,
      mobileWalletNumber: mobileWalletNumber,
      mobileWalletProvider: mobileWalletProvider,
      mobileWalletName: mobileWalletName,
      isActive: isActive,
      createdAt: createdAt,
      activeFrom: activeFrom,
    );
  }
}
