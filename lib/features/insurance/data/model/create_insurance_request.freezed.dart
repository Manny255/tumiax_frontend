// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_insurance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateInsuranceRequest {

@JsonKey(name: 'asset') String get assetId; String get provider;@JsonKey(name: 'policy_number') String get policyNumber;@DateOnlyConverter()@JsonKey(name: 'expiry_date') DateTime get expiryDate;@NullableDateOnlyConverter()@JsonKey(name: 'start_date') DateTime? get startDate; bool get active;@JsonKey(name: 'coverage_amount') double? get coverageAmount;@JsonKey(name: 'premium_amount') double? get premiumAmount;@JsonKey(name: 'premium_frequency') String? get premiumFrequency; String? get notes;
/// Create a copy of CreateInsuranceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInsuranceRequestCopyWith<CreateInsuranceRequest> get copyWith => _$CreateInsuranceRequestCopyWithImpl<CreateInsuranceRequest>(this as CreateInsuranceRequest, _$identity);

  /// Serializes this CreateInsuranceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInsuranceRequest&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.policyNumber, policyNumber) || other.policyNumber == policyNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.active, active) || other.active == active)&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&(identical(other.premiumAmount, premiumAmount) || other.premiumAmount == premiumAmount)&&(identical(other.premiumFrequency, premiumFrequency) || other.premiumFrequency == premiumFrequency)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,provider,policyNumber,expiryDate,startDate,active,coverageAmount,premiumAmount,premiumFrequency,notes);

@override
String toString() {
  return 'CreateInsuranceRequest(assetId: $assetId, provider: $provider, policyNumber: $policyNumber, expiryDate: $expiryDate, startDate: $startDate, active: $active, coverageAmount: $coverageAmount, premiumAmount: $premiumAmount, premiumFrequency: $premiumFrequency, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateInsuranceRequestCopyWith<$Res>  {
  factory $CreateInsuranceRequestCopyWith(CreateInsuranceRequest value, $Res Function(CreateInsuranceRequest) _then) = _$CreateInsuranceRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'asset') String assetId, String provider,@JsonKey(name: 'policy_number') String policyNumber,@DateOnlyConverter()@JsonKey(name: 'expiry_date') DateTime expiryDate,@NullableDateOnlyConverter()@JsonKey(name: 'start_date') DateTime? startDate, bool active,@JsonKey(name: 'coverage_amount') double? coverageAmount,@JsonKey(name: 'premium_amount') double? premiumAmount,@JsonKey(name: 'premium_frequency') String? premiumFrequency, String? notes
});




}
/// @nodoc
class _$CreateInsuranceRequestCopyWithImpl<$Res>
    implements $CreateInsuranceRequestCopyWith<$Res> {
  _$CreateInsuranceRequestCopyWithImpl(this._self, this._then);

  final CreateInsuranceRequest _self;
  final $Res Function(CreateInsuranceRequest) _then;

/// Create a copy of CreateInsuranceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assetId = null,Object? provider = null,Object? policyNumber = null,Object? expiryDate = null,Object? startDate = freezed,Object? active = null,Object? coverageAmount = freezed,Object? premiumAmount = freezed,Object? premiumFrequency = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
assetId: null == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,policyNumber: null == policyNumber ? _self.policyNumber : policyNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumAmount: freezed == premiumAmount ? _self.premiumAmount : premiumAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumFrequency: freezed == premiumFrequency ? _self.premiumFrequency : premiumFrequency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInsuranceRequest].
extension CreateInsuranceRequestPatterns on CreateInsuranceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInsuranceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInsuranceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInsuranceRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateInsuranceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInsuranceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInsuranceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'asset')  String assetId,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @DateOnlyConverter()@JsonKey(name: 'expiry_date')  DateTime expiryDate, @NullableDateOnlyConverter()@JsonKey(name: 'start_date')  DateTime? startDate,  bool active, @JsonKey(name: 'coverage_amount')  double? coverageAmount, @JsonKey(name: 'premium_amount')  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInsuranceRequest() when $default != null:
return $default(_that.assetId,_that.provider,_that.policyNumber,_that.expiryDate,_that.startDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'asset')  String assetId,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @DateOnlyConverter()@JsonKey(name: 'expiry_date')  DateTime expiryDate, @NullableDateOnlyConverter()@JsonKey(name: 'start_date')  DateTime? startDate,  bool active, @JsonKey(name: 'coverage_amount')  double? coverageAmount, @JsonKey(name: 'premium_amount')  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateInsuranceRequest():
return $default(_that.assetId,_that.provider,_that.policyNumber,_that.expiryDate,_that.startDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.notes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'asset')  String assetId,  String provider, @JsonKey(name: 'policy_number')  String policyNumber, @DateOnlyConverter()@JsonKey(name: 'expiry_date')  DateTime expiryDate, @NullableDateOnlyConverter()@JsonKey(name: 'start_date')  DateTime? startDate,  bool active, @JsonKey(name: 'coverage_amount')  double? coverageAmount, @JsonKey(name: 'premium_amount')  double? premiumAmount, @JsonKey(name: 'premium_frequency')  String? premiumFrequency,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateInsuranceRequest() when $default != null:
return $default(_that.assetId,_that.provider,_that.policyNumber,_that.expiryDate,_that.startDate,_that.active,_that.coverageAmount,_that.premiumAmount,_that.premiumFrequency,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateInsuranceRequest implements CreateInsuranceRequest {
  const _CreateInsuranceRequest({@JsonKey(name: 'asset') required this.assetId, required this.provider, @JsonKey(name: 'policy_number') required this.policyNumber, @DateOnlyConverter()@JsonKey(name: 'expiry_date') required this.expiryDate, @NullableDateOnlyConverter()@JsonKey(name: 'start_date') this.startDate, required this.active, @JsonKey(name: 'coverage_amount') this.coverageAmount, @JsonKey(name: 'premium_amount') this.premiumAmount, @JsonKey(name: 'premium_frequency') this.premiumFrequency, this.notes});
  factory _CreateInsuranceRequest.fromJson(Map<String, dynamic> json) => _$CreateInsuranceRequestFromJson(json);

@override@JsonKey(name: 'asset') final  String assetId;
@override final  String provider;
@override@JsonKey(name: 'policy_number') final  String policyNumber;
@override@DateOnlyConverter()@JsonKey(name: 'expiry_date') final  DateTime expiryDate;
@override@NullableDateOnlyConverter()@JsonKey(name: 'start_date') final  DateTime? startDate;
@override final  bool active;
@override@JsonKey(name: 'coverage_amount') final  double? coverageAmount;
@override@JsonKey(name: 'premium_amount') final  double? premiumAmount;
@override@JsonKey(name: 'premium_frequency') final  String? premiumFrequency;
@override final  String? notes;

/// Create a copy of CreateInsuranceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInsuranceRequestCopyWith<_CreateInsuranceRequest> get copyWith => __$CreateInsuranceRequestCopyWithImpl<_CreateInsuranceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateInsuranceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInsuranceRequest&&(identical(other.assetId, assetId) || other.assetId == assetId)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.policyNumber, policyNumber) || other.policyNumber == policyNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.active, active) || other.active == active)&&(identical(other.coverageAmount, coverageAmount) || other.coverageAmount == coverageAmount)&&(identical(other.premiumAmount, premiumAmount) || other.premiumAmount == premiumAmount)&&(identical(other.premiumFrequency, premiumFrequency) || other.premiumFrequency == premiumFrequency)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assetId,provider,policyNumber,expiryDate,startDate,active,coverageAmount,premiumAmount,premiumFrequency,notes);

@override
String toString() {
  return 'CreateInsuranceRequest(assetId: $assetId, provider: $provider, policyNumber: $policyNumber, expiryDate: $expiryDate, startDate: $startDate, active: $active, coverageAmount: $coverageAmount, premiumAmount: $premiumAmount, premiumFrequency: $premiumFrequency, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateInsuranceRequestCopyWith<$Res> implements $CreateInsuranceRequestCopyWith<$Res> {
  factory _$CreateInsuranceRequestCopyWith(_CreateInsuranceRequest value, $Res Function(_CreateInsuranceRequest) _then) = __$CreateInsuranceRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'asset') String assetId, String provider,@JsonKey(name: 'policy_number') String policyNumber,@DateOnlyConverter()@JsonKey(name: 'expiry_date') DateTime expiryDate,@NullableDateOnlyConverter()@JsonKey(name: 'start_date') DateTime? startDate, bool active,@JsonKey(name: 'coverage_amount') double? coverageAmount,@JsonKey(name: 'premium_amount') double? premiumAmount,@JsonKey(name: 'premium_frequency') String? premiumFrequency, String? notes
});




}
/// @nodoc
class __$CreateInsuranceRequestCopyWithImpl<$Res>
    implements _$CreateInsuranceRequestCopyWith<$Res> {
  __$CreateInsuranceRequestCopyWithImpl(this._self, this._then);

  final _CreateInsuranceRequest _self;
  final $Res Function(_CreateInsuranceRequest) _then;

/// Create a copy of CreateInsuranceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assetId = null,Object? provider = null,Object? policyNumber = null,Object? expiryDate = null,Object? startDate = freezed,Object? active = null,Object? coverageAmount = freezed,Object? premiumAmount = freezed,Object? premiumFrequency = freezed,Object? notes = freezed,}) {
  return _then(_CreateInsuranceRequest(
assetId: null == assetId ? _self.assetId : assetId // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,policyNumber: null == policyNumber ? _self.policyNumber : policyNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,coverageAmount: freezed == coverageAmount ? _self.coverageAmount : coverageAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumAmount: freezed == premiumAmount ? _self.premiumAmount : premiumAmount // ignore: cast_nullable_to_non_nullable
as double?,premiumFrequency: freezed == premiumFrequency ? _self.premiumFrequency : premiumFrequency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
