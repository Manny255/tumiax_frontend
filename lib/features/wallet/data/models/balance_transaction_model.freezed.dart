// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BalanceTransactionModel {

 String get id;@JsonKey(name: 'transaction_type') String get transactionType; String get status; double get amount;@JsonKey(name: 'running_balance') double get runningBalance; String? get description;@JsonKey(name: 'reference_id') String get referenceId;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of BalanceTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceTransactionModelCopyWith<BalanceTransactionModel> get copyWith => _$BalanceTransactionModelCopyWithImpl<BalanceTransactionModel>(this as BalanceTransactionModel, _$identity);

  /// Serializes this BalanceTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.runningBalance, runningBalance) || other.runningBalance == runningBalance)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionType,status,amount,runningBalance,description,referenceId,createdAt);

@override
String toString() {
  return 'BalanceTransactionModel(id: $id, transactionType: $transactionType, status: $status, amount: $amount, runningBalance: $runningBalance, description: $description, referenceId: $referenceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BalanceTransactionModelCopyWith<$Res>  {
  factory $BalanceTransactionModelCopyWith(BalanceTransactionModel value, $Res Function(BalanceTransactionModel) _then) = _$BalanceTransactionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'transaction_type') String transactionType, String status, double amount,@JsonKey(name: 'running_balance') double runningBalance, String? description,@JsonKey(name: 'reference_id') String referenceId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$BalanceTransactionModelCopyWithImpl<$Res>
    implements $BalanceTransactionModelCopyWith<$Res> {
  _$BalanceTransactionModelCopyWithImpl(this._self, this._then);

  final BalanceTransactionModel _self;
  final $Res Function(BalanceTransactionModel) _then;

/// Create a copy of BalanceTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? transactionType = null,Object? status = null,Object? amount = null,Object? runningBalance = null,Object? description = freezed,Object? referenceId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,runningBalance: null == runningBalance ? _self.runningBalance : runningBalance // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: null == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [BalanceTransactionModel].
extension BalanceTransactionModelPatterns on BalanceTransactionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BalanceTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BalanceTransactionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BalanceTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _BalanceTransactionModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BalanceTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _BalanceTransactionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'transaction_type')  String transactionType,  String status,  double amount, @JsonKey(name: 'running_balance')  double runningBalance,  String? description, @JsonKey(name: 'reference_id')  String referenceId, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BalanceTransactionModel() when $default != null:
return $default(_that.id,_that.transactionType,_that.status,_that.amount,_that.runningBalance,_that.description,_that.referenceId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'transaction_type')  String transactionType,  String status,  double amount, @JsonKey(name: 'running_balance')  double runningBalance,  String? description, @JsonKey(name: 'reference_id')  String referenceId, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _BalanceTransactionModel():
return $default(_that.id,_that.transactionType,_that.status,_that.amount,_that.runningBalance,_that.description,_that.referenceId,_that.createdAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'transaction_type')  String transactionType,  String status,  double amount, @JsonKey(name: 'running_balance')  double runningBalance,  String? description, @JsonKey(name: 'reference_id')  String referenceId, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BalanceTransactionModel() when $default != null:
return $default(_that.id,_that.transactionType,_that.status,_that.amount,_that.runningBalance,_that.description,_that.referenceId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BalanceTransactionModel implements BalanceTransactionModel {
  const _BalanceTransactionModel({required this.id, @JsonKey(name: 'transaction_type') required this.transactionType, required this.status, required this.amount, @JsonKey(name: 'running_balance') required this.runningBalance, this.description, @JsonKey(name: 'reference_id') required this.referenceId, @JsonKey(name: 'created_at') required this.createdAt});
  factory _BalanceTransactionModel.fromJson(Map<String, dynamic> json) => _$BalanceTransactionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'transaction_type') final  String transactionType;
@override final  String status;
@override final  double amount;
@override@JsonKey(name: 'running_balance') final  double runningBalance;
@override final  String? description;
@override@JsonKey(name: 'reference_id') final  String referenceId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of BalanceTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceTransactionModelCopyWith<_BalanceTransactionModel> get copyWith => __$BalanceTransactionModelCopyWithImpl<_BalanceTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BalanceTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.runningBalance, runningBalance) || other.runningBalance == runningBalance)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,transactionType,status,amount,runningBalance,description,referenceId,createdAt);

@override
String toString() {
  return 'BalanceTransactionModel(id: $id, transactionType: $transactionType, status: $status, amount: $amount, runningBalance: $runningBalance, description: $description, referenceId: $referenceId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BalanceTransactionModelCopyWith<$Res> implements $BalanceTransactionModelCopyWith<$Res> {
  factory _$BalanceTransactionModelCopyWith(_BalanceTransactionModel value, $Res Function(_BalanceTransactionModel) _then) = __$BalanceTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'transaction_type') String transactionType, String status, double amount,@JsonKey(name: 'running_balance') double runningBalance, String? description,@JsonKey(name: 'reference_id') String referenceId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$BalanceTransactionModelCopyWithImpl<$Res>
    implements _$BalanceTransactionModelCopyWith<$Res> {
  __$BalanceTransactionModelCopyWithImpl(this._self, this._then);

  final _BalanceTransactionModel _self;
  final $Res Function(_BalanceTransactionModel) _then;

/// Create a copy of BalanceTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? transactionType = null,Object? status = null,Object? amount = null,Object? runningBalance = null,Object? description = freezed,Object? referenceId = null,Object? createdAt = null,}) {
  return _then(_BalanceTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,runningBalance: null == runningBalance ? _self.runningBalance : runningBalance // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: null == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
