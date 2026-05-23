// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payout_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayoutMethodModel {

 int get id;/// "BT" or "Mo"
 String get method;// =========================
// BANK FIELDS
// =========================
@JsonKey(name: 'bank_name') String? get bankName;@JsonKey(name: 'account_number') String? get accountNumber;@JsonKey(name: 'account_holder') String? get accountHolder;@JsonKey(name: 'account_currency') String? get accountCurrency;@JsonKey(name: 'swift_code') String? get swiftCode;@JsonKey(name: 'routing_number') String? get routingNumber; String? get iban;// =========================
// MOBILE WALLET FIELDS
// =========================
@JsonKey(name: 'mobile_wallet_number') String? get mobileWalletNumber;@JsonKey(name: 'mobile_wallet_provider') String? get mobileWalletProvider;@JsonKey(name: 'mobile_wallet_name') String? get mobileWalletName;// =========================
// STATUS FIELDS
// =========================
@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'active_from') DateTime? get activeFrom;
/// Create a copy of PayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutMethodModelCopyWith<PayoutMethodModel> get copyWith => _$PayoutMethodModelCopyWithImpl<PayoutMethodModel>(this as PayoutMethodModel, _$identity);

  /// Serializes this PayoutMethodModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolder, accountHolder) || other.accountHolder == accountHolder)&&(identical(other.accountCurrency, accountCurrency) || other.accountCurrency == accountCurrency)&&(identical(other.swiftCode, swiftCode) || other.swiftCode == swiftCode)&&(identical(other.routingNumber, routingNumber) || other.routingNumber == routingNumber)&&(identical(other.iban, iban) || other.iban == iban)&&(identical(other.mobileWalletNumber, mobileWalletNumber) || other.mobileWalletNumber == mobileWalletNumber)&&(identical(other.mobileWalletProvider, mobileWalletProvider) || other.mobileWalletProvider == mobileWalletProvider)&&(identical(other.mobileWalletName, mobileWalletName) || other.mobileWalletName == mobileWalletName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.activeFrom, activeFrom) || other.activeFrom == activeFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,bankName,accountNumber,accountHolder,accountCurrency,swiftCode,routingNumber,iban,mobileWalletNumber,mobileWalletProvider,mobileWalletName,isActive,createdAt,activeFrom);

@override
String toString() {
  return 'PayoutMethodModel(id: $id, method: $method, bankName: $bankName, accountNumber: $accountNumber, accountHolder: $accountHolder, accountCurrency: $accountCurrency, swiftCode: $swiftCode, routingNumber: $routingNumber, iban: $iban, mobileWalletNumber: $mobileWalletNumber, mobileWalletProvider: $mobileWalletProvider, mobileWalletName: $mobileWalletName, isActive: $isActive, createdAt: $createdAt, activeFrom: $activeFrom)';
}


}

/// @nodoc
abstract mixin class $PayoutMethodModelCopyWith<$Res>  {
  factory $PayoutMethodModelCopyWith(PayoutMethodModel value, $Res Function(PayoutMethodModel) _then) = _$PayoutMethodModelCopyWithImpl;
@useResult
$Res call({
 int id, String method,@JsonKey(name: 'bank_name') String? bankName,@JsonKey(name: 'account_number') String? accountNumber,@JsonKey(name: 'account_holder') String? accountHolder,@JsonKey(name: 'account_currency') String? accountCurrency,@JsonKey(name: 'swift_code') String? swiftCode,@JsonKey(name: 'routing_number') String? routingNumber, String? iban,@JsonKey(name: 'mobile_wallet_number') String? mobileWalletNumber,@JsonKey(name: 'mobile_wallet_provider') String? mobileWalletProvider,@JsonKey(name: 'mobile_wallet_name') String? mobileWalletName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'active_from') DateTime? activeFrom
});




}
/// @nodoc
class _$PayoutMethodModelCopyWithImpl<$Res>
    implements $PayoutMethodModelCopyWith<$Res> {
  _$PayoutMethodModelCopyWithImpl(this._self, this._then);

  final PayoutMethodModel _self;
  final $Res Function(PayoutMethodModel) _then;

/// Create a copy of PayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolder = freezed,Object? accountCurrency = freezed,Object? swiftCode = freezed,Object? routingNumber = freezed,Object? iban = freezed,Object? mobileWalletNumber = freezed,Object? mobileWalletProvider = freezed,Object? mobileWalletName = freezed,Object? isActive = null,Object? createdAt = null,Object? activeFrom = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolder: freezed == accountHolder ? _self.accountHolder : accountHolder // ignore: cast_nullable_to_non_nullable
as String?,accountCurrency: freezed == accountCurrency ? _self.accountCurrency : accountCurrency // ignore: cast_nullable_to_non_nullable
as String?,swiftCode: freezed == swiftCode ? _self.swiftCode : swiftCode // ignore: cast_nullable_to_non_nullable
as String?,routingNumber: freezed == routingNumber ? _self.routingNumber : routingNumber // ignore: cast_nullable_to_non_nullable
as String?,iban: freezed == iban ? _self.iban : iban // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletNumber: freezed == mobileWalletNumber ? _self.mobileWalletNumber : mobileWalletNumber // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletProvider: freezed == mobileWalletProvider ? _self.mobileWalletProvider : mobileWalletProvider // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletName: freezed == mobileWalletName ? _self.mobileWalletName : mobileWalletName // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,activeFrom: freezed == activeFrom ? _self.activeFrom : activeFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutMethodModel].
extension PayoutMethodModelPatterns on PayoutMethodModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutMethodModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutMethodModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutMethodModel value)  $default,){
final _that = this;
switch (_that) {
case _PayoutMethodModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutMethodModel value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutMethodModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String method, @JsonKey(name: 'bank_name')  String? bankName, @JsonKey(name: 'account_number')  String? accountNumber, @JsonKey(name: 'account_holder')  String? accountHolder, @JsonKey(name: 'account_currency')  String? accountCurrency, @JsonKey(name: 'swift_code')  String? swiftCode, @JsonKey(name: 'routing_number')  String? routingNumber,  String? iban, @JsonKey(name: 'mobile_wallet_number')  String? mobileWalletNumber, @JsonKey(name: 'mobile_wallet_provider')  String? mobileWalletProvider, @JsonKey(name: 'mobile_wallet_name')  String? mobileWalletName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'active_from')  DateTime? activeFrom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutMethodModel() when $default != null:
return $default(_that.id,_that.method,_that.bankName,_that.accountNumber,_that.accountHolder,_that.accountCurrency,_that.swiftCode,_that.routingNumber,_that.iban,_that.mobileWalletNumber,_that.mobileWalletProvider,_that.mobileWalletName,_that.isActive,_that.createdAt,_that.activeFrom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String method, @JsonKey(name: 'bank_name')  String? bankName, @JsonKey(name: 'account_number')  String? accountNumber, @JsonKey(name: 'account_holder')  String? accountHolder, @JsonKey(name: 'account_currency')  String? accountCurrency, @JsonKey(name: 'swift_code')  String? swiftCode, @JsonKey(name: 'routing_number')  String? routingNumber,  String? iban, @JsonKey(name: 'mobile_wallet_number')  String? mobileWalletNumber, @JsonKey(name: 'mobile_wallet_provider')  String? mobileWalletProvider, @JsonKey(name: 'mobile_wallet_name')  String? mobileWalletName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'active_from')  DateTime? activeFrom)  $default,) {final _that = this;
switch (_that) {
case _PayoutMethodModel():
return $default(_that.id,_that.method,_that.bankName,_that.accountNumber,_that.accountHolder,_that.accountCurrency,_that.swiftCode,_that.routingNumber,_that.iban,_that.mobileWalletNumber,_that.mobileWalletProvider,_that.mobileWalletName,_that.isActive,_that.createdAt,_that.activeFrom);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String method, @JsonKey(name: 'bank_name')  String? bankName, @JsonKey(name: 'account_number')  String? accountNumber, @JsonKey(name: 'account_holder')  String? accountHolder, @JsonKey(name: 'account_currency')  String? accountCurrency, @JsonKey(name: 'swift_code')  String? swiftCode, @JsonKey(name: 'routing_number')  String? routingNumber,  String? iban, @JsonKey(name: 'mobile_wallet_number')  String? mobileWalletNumber, @JsonKey(name: 'mobile_wallet_provider')  String? mobileWalletProvider, @JsonKey(name: 'mobile_wallet_name')  String? mobileWalletName, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'active_from')  DateTime? activeFrom)?  $default,) {final _that = this;
switch (_that) {
case _PayoutMethodModel() when $default != null:
return $default(_that.id,_that.method,_that.bankName,_that.accountNumber,_that.accountHolder,_that.accountCurrency,_that.swiftCode,_that.routingNumber,_that.iban,_that.mobileWalletNumber,_that.mobileWalletProvider,_that.mobileWalletName,_that.isActive,_that.createdAt,_that.activeFrom);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PayoutMethodModel implements PayoutMethodModel {
  const _PayoutMethodModel({required this.id, required this.method, @JsonKey(name: 'bank_name') this.bankName, @JsonKey(name: 'account_number') this.accountNumber, @JsonKey(name: 'account_holder') this.accountHolder, @JsonKey(name: 'account_currency') this.accountCurrency, @JsonKey(name: 'swift_code') this.swiftCode, @JsonKey(name: 'routing_number') this.routingNumber, this.iban, @JsonKey(name: 'mobile_wallet_number') this.mobileWalletNumber, @JsonKey(name: 'mobile_wallet_provider') this.mobileWalletProvider, @JsonKey(name: 'mobile_wallet_name') this.mobileWalletName, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'active_from') this.activeFrom});
  factory _PayoutMethodModel.fromJson(Map<String, dynamic> json) => _$PayoutMethodModelFromJson(json);

@override final  int id;
/// "BT" or "Mo"
@override final  String method;
// =========================
// BANK FIELDS
// =========================
@override@JsonKey(name: 'bank_name') final  String? bankName;
@override@JsonKey(name: 'account_number') final  String? accountNumber;
@override@JsonKey(name: 'account_holder') final  String? accountHolder;
@override@JsonKey(name: 'account_currency') final  String? accountCurrency;
@override@JsonKey(name: 'swift_code') final  String? swiftCode;
@override@JsonKey(name: 'routing_number') final  String? routingNumber;
@override final  String? iban;
// =========================
// MOBILE WALLET FIELDS
// =========================
@override@JsonKey(name: 'mobile_wallet_number') final  String? mobileWalletNumber;
@override@JsonKey(name: 'mobile_wallet_provider') final  String? mobileWalletProvider;
@override@JsonKey(name: 'mobile_wallet_name') final  String? mobileWalletName;
// =========================
// STATUS FIELDS
// =========================
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'active_from') final  DateTime? activeFrom;

/// Create a copy of PayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutMethodModelCopyWith<_PayoutMethodModel> get copyWith => __$PayoutMethodModelCopyWithImpl<_PayoutMethodModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PayoutMethodModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutMethodModel&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolder, accountHolder) || other.accountHolder == accountHolder)&&(identical(other.accountCurrency, accountCurrency) || other.accountCurrency == accountCurrency)&&(identical(other.swiftCode, swiftCode) || other.swiftCode == swiftCode)&&(identical(other.routingNumber, routingNumber) || other.routingNumber == routingNumber)&&(identical(other.iban, iban) || other.iban == iban)&&(identical(other.mobileWalletNumber, mobileWalletNumber) || other.mobileWalletNumber == mobileWalletNumber)&&(identical(other.mobileWalletProvider, mobileWalletProvider) || other.mobileWalletProvider == mobileWalletProvider)&&(identical(other.mobileWalletName, mobileWalletName) || other.mobileWalletName == mobileWalletName)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.activeFrom, activeFrom) || other.activeFrom == activeFrom));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,bankName,accountNumber,accountHolder,accountCurrency,swiftCode,routingNumber,iban,mobileWalletNumber,mobileWalletProvider,mobileWalletName,isActive,createdAt,activeFrom);

@override
String toString() {
  return 'PayoutMethodModel(id: $id, method: $method, bankName: $bankName, accountNumber: $accountNumber, accountHolder: $accountHolder, accountCurrency: $accountCurrency, swiftCode: $swiftCode, routingNumber: $routingNumber, iban: $iban, mobileWalletNumber: $mobileWalletNumber, mobileWalletProvider: $mobileWalletProvider, mobileWalletName: $mobileWalletName, isActive: $isActive, createdAt: $createdAt, activeFrom: $activeFrom)';
}


}

/// @nodoc
abstract mixin class _$PayoutMethodModelCopyWith<$Res> implements $PayoutMethodModelCopyWith<$Res> {
  factory _$PayoutMethodModelCopyWith(_PayoutMethodModel value, $Res Function(_PayoutMethodModel) _then) = __$PayoutMethodModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String method,@JsonKey(name: 'bank_name') String? bankName,@JsonKey(name: 'account_number') String? accountNumber,@JsonKey(name: 'account_holder') String? accountHolder,@JsonKey(name: 'account_currency') String? accountCurrency,@JsonKey(name: 'swift_code') String? swiftCode,@JsonKey(name: 'routing_number') String? routingNumber, String? iban,@JsonKey(name: 'mobile_wallet_number') String? mobileWalletNumber,@JsonKey(name: 'mobile_wallet_provider') String? mobileWalletProvider,@JsonKey(name: 'mobile_wallet_name') String? mobileWalletName,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'active_from') DateTime? activeFrom
});




}
/// @nodoc
class __$PayoutMethodModelCopyWithImpl<$Res>
    implements _$PayoutMethodModelCopyWith<$Res> {
  __$PayoutMethodModelCopyWithImpl(this._self, this._then);

  final _PayoutMethodModel _self;
  final $Res Function(_PayoutMethodModel) _then;

/// Create a copy of PayoutMethodModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolder = freezed,Object? accountCurrency = freezed,Object? swiftCode = freezed,Object? routingNumber = freezed,Object? iban = freezed,Object? mobileWalletNumber = freezed,Object? mobileWalletProvider = freezed,Object? mobileWalletName = freezed,Object? isActive = null,Object? createdAt = null,Object? activeFrom = freezed,}) {
  return _then(_PayoutMethodModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolder: freezed == accountHolder ? _self.accountHolder : accountHolder // ignore: cast_nullable_to_non_nullable
as String?,accountCurrency: freezed == accountCurrency ? _self.accountCurrency : accountCurrency // ignore: cast_nullable_to_non_nullable
as String?,swiftCode: freezed == swiftCode ? _self.swiftCode : swiftCode // ignore: cast_nullable_to_non_nullable
as String?,routingNumber: freezed == routingNumber ? _self.routingNumber : routingNumber // ignore: cast_nullable_to_non_nullable
as String?,iban: freezed == iban ? _self.iban : iban // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletNumber: freezed == mobileWalletNumber ? _self.mobileWalletNumber : mobileWalletNumber // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletProvider: freezed == mobileWalletProvider ? _self.mobileWalletProvider : mobileWalletProvider // ignore: cast_nullable_to_non_nullable
as String?,mobileWalletName: freezed == mobileWalletName ? _self.mobileWalletName : mobileWalletName // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,activeFrom: freezed == activeFrom ? _self.activeFrom : activeFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
