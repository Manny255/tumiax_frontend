import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_balance_model.freezed.dart';
part 'user_balance_model.g.dart';

@freezed
sealed class UserBalanceModel with _$UserBalanceModel {
  const factory UserBalanceModel({
    required String id,
    required double balance,
    @JsonKey(name: 'total_deposited') required double totalDeposited,
    @JsonKey(name: 'total_withdrawn') required double totalWithdrawn,
    @JsonKey(name: 'is_frozen') required bool isFrozen,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserBalanceModel;

  factory UserBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceModelFromJson(json);
}
