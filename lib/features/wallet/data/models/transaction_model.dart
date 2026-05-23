// lib/features/wallet/data/models/transaction_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,

    @JsonKey(name: 'transaction_type') required String transactionType,

    @JsonKey(fromJson: _doubleFromJson) required double amount,

    @JsonKey(fromJson: _doubleFromJson) required double fee,

    required String description,

    String? merchant,

    @JsonKey(name: 'merchant_category') String? merchantCategory,

    @JsonKey(name: 'reference_id') required String referenceId,

    String? status,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'settled_at') DateTime? settledAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

double _doubleFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
