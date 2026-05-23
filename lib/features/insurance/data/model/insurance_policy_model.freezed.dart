// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insurance_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InsurancePolicyModel {

 int get id;/// UUID of asset
 String get asset;@JsonKey(name: 'asset_details') Map<String, dynamic>? get assetDetails; String get provider;@JsonKey(name: 'policy_number') String get policyNumber;@JsonKey(name: 'expiry_date') DateTime get expiryDate; bool get active;@JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? get coverageAmount;@JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? get premiumAmount;@JsonKey(name: 'premium_frequency') String? get premiumFrequency;@JsonKey(name: 'start_date') DateTime? get startDate; String? get notes;@JsonKey(name: 'is_expired') bool? get isExpired;@JsonKey(name: 'days_until_expiry') int? get daysUntilExpiry;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of InsurancePolicyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InsurancePolicyModelCopyWith<InsurancePolicyModel> get copyWith => _$InsurancePolicyModelCopyWithImpl<InsurancePolicyModel>(this as InsurancePolicyModel, _$identity);

  /// Serializes this InsurancePolicyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InsurancePolicyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&const DeepCollectionEquality().equals(other.assetDetails, assetDetails)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.policyNumber, policyNumber) || other.policyNumber == policyNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.active, active) || other.active == active)&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&(identical(other.premiumAmount, premiumAmount) || other.premiumAmount == premiumAmount)&&(identical(other.premiumFrequency, premiumFrequency) || other.premiumFrequency == premiumFrequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.daysUntilExpiry, daysUntilExpiry) || other.daysUntilExpiry == daysUntilExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asset,const DeepCollectionEquality().hash(assetDetails),provider,policyNumber,expiryDate,active,coverageAmount,premiumAmount,premiumFrequency,startDate,notes,isExpired,daysUntilExpiry,createdAt,updatedAt);

@override
String toString() {
  return 'InsurancePolicyModel(id: $id, asset: $asset, assetDetails: $assetDetails, provider: $provider, policyNumber: $policyNumber, expiryDate: $expiryDate, active: $active, coverageAmount: $coverageAmount, premiumAmount: $premiumAmount, premiumFrequency: $premiumFrequency, startDate: $startDate, notes: $notes, isExpired: $isExpired, daysUntilExpiry: $daysUntilExpiry, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $InsurancePolicyModelCopyWith<$Res>  {
  factory $InsurancePolicyModelCopyWith(InsurancePolicyModel value, $Res Function(InsurancePolicyModel) _then) = _$InsurancePolicyModelCopyWithImpl;
@useResult
$Res call({
 int id, String asset,@JsonKey(name: 'asset_details') Map<String, dynamic>? assetDetails, String provider,@JsonKey(name: 'policy_number') String policyNumber,@JsonKey(name: 'expiry_date') DateTime expiryDate, bool active,@JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? coverageAmount,@JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? premiumAmount,@JsonKey(name: 'premium_frequency') String? premiumFrequency,@JsonKey(name: 'start_date') DateTime? startDate, String? notes,@JsonKey(name: 'is_expired') bool? isExpired,@JsonKey(name: 'days_until_expiry') int? daysUntilExpiry,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$InsurancePolicyModelCopyWithImpl<$Res>
    implements $InsurancePolicyModelCopyWith<$Res> {
  _$InsurancePolicyModelCopyWithImpl(this._self, this._then);

  final InsurancePolicyModel _self;
  final $Res Function(InsurancePolicyModel) _then;

/// Create a copy of InsurancePolicyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? asset = null,Object? assetDetails = freezed,Object? provider = null,Object? policyNumber = null,Object? expiryDate = null,Object? active = null,Object? coverageAmount = freezed,Object? premiumAmount = freezed,Object? premiumFrequency = freezed,Object? startDate = freezed,Object? notes = freezed,Object? isExpired = freezed,Object? daysUntilExpiry = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as String,assetDetails: freezed == assetDetails ? _self.assetDetails : assetDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,policyNumber: null == policyNumber ? _self.policyNumber : policyNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumAmount: freezed == premiumAmount ? _self.premiumAmount : premiumAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumFrequency: freezed == premiumFrequency ? _self.premiumFrequency : premiumFrequency // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isExpired: freezed == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool?,daysUntilExpiry: freezed == daysUntilExpiry ? _self.daysUntilExpiry : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [InsurancePolicyModel].
extension InsurancePolicyModelPatterns on InsurancePolicyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InsurancePolicyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InsurancePolicyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InsurancePolicyModel value)  $default,){
final _that = this;
switch (_that) {
case _InsurancePolicyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InsurancePolicyModel value)?  $default,){
final _that = this;
switch (_that) {
case _InsurancePolicyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String asset, @JsonKey(name: 'asset_details')  Map<String, dynamic>? assetDetails,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate,  bool active, @JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? coverageAmount, @JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency, @JsonKey(name: 'start_date')  DateTime? startDate,  String? notes, @JsonKey(name: 'is_expired')  bool? isExpired, @JsonKey(name: 'days_until_expiry')  int? daysUntilExpiry, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InsurancePolicyModel() when $default != null:
return $default(_that.id,_that.asset,_that.assetDetails,_that.provider,_that.policyNumber,_that.expiryDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.startDate,_that.notes,_that.isExpired,_that.daysUntilExpiry,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String asset, @JsonKey(name: 'asset_details')  Map<String, dynamic>? assetDetails,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate,  bool active, @JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? coverageAmount, @JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency, @JsonKey(name: 'start_date')  DateTime? startDate,  String? notes, @JsonKey(name: 'is_expired')  bool? isExpired, @JsonKey(name: 'days_until_expiry')  int? daysUntilExpiry, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InsurancePolicyModel():
return $default(_that.id,_that.asset,_that.assetDetails,_that.provider,_that.policyNumber,_that.expiryDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.startDate,_that.notes,_that.isExpired,_that.daysUntilExpiry,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String asset, @JsonKey(name: 'asset_details')  Map<String, dynamic>? assetDetails,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @JsonKey(name: 'expiry_date')  DateTime expiryDate,  bool active, @JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? coverageAmount, @JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString)  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency, @JsonKey(name: 'start_date')  DateTime? startDate,  String? notes, @JsonKey(name: 'is_expired')  bool? isExpired, @JsonKey(name: 'days_until_expiry')  int? daysUntilExpiry, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InsurancePolicyModel() when $default != null:
return $default(_that.id,_that.asset,_that.assetDetails,_that.provider,_that.policyNumber,_that.expiryDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.startDate,_that.notes,_that.isExpired,_that.daysUntilExpiry,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InsurancePolicyModel implements InsurancePolicyModel {
  const _InsurancePolicyModel({required this.id, required this.asset, @JsonKey(name: 'asset_details') final  Map<String, dynamic>? assetDetails, required this.provider, @JsonKey(name: 'policy_number') required this.policyNumber, @JsonKey(name: 'expiry_date') required this.expiryDate, required this.active, @JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString) this.coverageAmount, @JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString) this.premiumAmount, @JsonKey(name: 'premium_frequency') this.premiumFrequency, @JsonKey(name: 'start_date') this.startDate, this.notes, @JsonKey(name: 'is_expired') this.isExpired, @JsonKey(name: 'days_until_expiry') this.daysUntilExpiry, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _assetDetails = assetDetails;
  factory _InsurancePolicyModel.fromJson(Map<String, dynamic> json) => _$InsurancePolicyModelFromJson(json);

@override final  int id;
/// UUID of asset
@override final  String asset;
 final  Map<String, dynamic>? _assetDetails;
@override@JsonKey(name: 'asset_details') Map<String, dynamic>? get assetDetails {
  final value = _assetDetails;
  if (value == null) return null;
  if (_assetDetails is EqualUnmodifiableMapView) return _assetDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String provider;
@override@JsonKey(name: 'policy_number') final  String policyNumber;
@override@JsonKey(name: 'expiry_date') final  DateTime expiryDate;
@override final  bool active;
@override@JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString) final  double? coverageAmount;
@override@JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString) final  double? premiumAmount;
@override@JsonKey(name: 'premium_frequency') final  String? premiumFrequency;
@override@JsonKey(name: 'start_date') final  DateTime? startDate;
@override final  String? notes;
@override@JsonKey(name: 'is_expired') final  bool? isExpired;
@override@JsonKey(name: 'days_until_expiry') final  int? daysUntilExpiry;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of InsurancePolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InsurancePolicyModelCopyWith<_InsurancePolicyModel> get copyWith => __$InsurancePolicyModelCopyWithImpl<_InsurancePolicyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InsurancePolicyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InsurancePolicyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&const DeepCollectionEquality().equals(other._assetDetails, _assetDetails)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.policyNumber, policyNumber) || other.policyNumber == policyNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.active, active) || other.active == active)&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&(identical(other.premiumAmount, premiumAmount) || other.premiumAmount == premiumAmount)&&(identical(other.premiumFrequency, premiumFrequency) || other.premiumFrequency == premiumFrequency)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isExpired, isExpired) || other.isExpired == isExpired)&&(identical(other.daysUntilExpiry, daysUntilExpiry) || other.daysUntilExpiry == daysUntilExpiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asset,const DeepCollectionEquality().hash(_assetDetails),provider,policyNumber,expiryDate,active,coverageAmount,premiumAmount,premiumFrequency,startDate,notes,isExpired,daysUntilExpiry,createdAt,updatedAt);

@override
String toString() {
  return 'InsurancePolicyModel(id: $id, asset: $asset, assetDetails: $assetDetails, provider: $provider, policyNumber: $policyNumber, expiryDate: $expiryDate, active: $active, coverageAmount: $coverageAmount, premiumAmount: $premiumAmount, premiumFrequency: $premiumFrequency, startDate: $startDate, notes: $notes, isExpired: $isExpired, daysUntilExpiry: $daysUntilExpiry, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InsurancePolicyModelCopyWith<$Res> implements $InsurancePolicyModelCopyWith<$Res> {
  factory _$InsurancePolicyModelCopyWith(_InsurancePolicyModel value, $Res Function(_InsurancePolicyModel) _then) = __$InsurancePolicyModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String asset,@JsonKey(name: 'asset_details') Map<String, dynamic>? assetDetails, String provider,@JsonKey(name: 'policy_number') String policyNumber,@JsonKey(name: 'expiry_date') DateTime expiryDate, bool active,@JsonKey(name: 'coverage_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? coverageAmount,@JsonKey(name: 'premium_amount', fromJson: _stringToDouble, toJson: _doubleToString) double? premiumAmount,@JsonKey(name: 'premium_frequency') String? premiumFrequency,@JsonKey(name: 'start_date') DateTime? startDate, String? notes,@JsonKey(name: 'is_expired') bool? isExpired,@JsonKey(name: 'days_until_expiry') int? daysUntilExpiry,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$InsurancePolicyModelCopyWithImpl<$Res>
    implements _$InsurancePolicyModelCopyWith<$Res> {
  __$InsurancePolicyModelCopyWithImpl(this._self, this._then);

  final _InsurancePolicyModel _self;
  final $Res Function(_InsurancePolicyModel) _then;

/// Create a copy of InsurancePolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? asset = null,Object? assetDetails = freezed,Object? provider = null,Object? policyNumber = null,Object? expiryDate = null,Object? active = null,Object? coverageAmount = freezed,Object? premiumAmount = freezed,Object? premiumFrequency = freezed,Object? startDate = freezed,Object? notes = freezed,Object? isExpired = freezed,Object? daysUntilExpiry = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_InsurancePolicyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as String,assetDetails: freezed == assetDetails ? _self._assetDetails : assetDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,policyNumber: null == policyNumber ? _self.policyNumber : policyNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumAmount: freezed == premiumAmount ? _self.premiumAmount : premiumAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumFrequency: freezed == premiumFrequency ? _self.premiumFrequency : premiumFrequency // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isExpired: freezed == isExpired ? _self.isExpired : isExpired // ignore: cast_nullable_to_non_nullable
as bool?,daysUntilExpiry: freezed == daysUntilExpiry ? _self.daysUntilExpiry : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
