// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_lookup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KYCLookupModel {

/// Recipient email
 String get email;/// Verified full name
@JsonKey(name: 'full_name') String? get fullName;/// Selfie image URL
@JsonKey(name: 'selfie_url') String? get selfieUrl;/// NOT_STARTED, PENDING, VERIFIED, REJECTED, EXPIRED
 String get status;/// BASIC, STANDARD, ADVANCED, FULL
 String get level;/// Risk score (0–100)
@JsonKey(name: 'risk_score') int get riskScore;/// Politically exposed person flag
@JsonKey(name: 'pep_check') bool get pepCheck;/// Sanctions flag
@JsonKey(name: 'sanction_check') bool get sanctionCheck;/// Adverse media flag
@JsonKey(name: 'adverse_media') bool get adverseMedia;/// Expiry date
@JsonKey(name: 'expires_at') DateTime? get expiresAt;/// Whether allowed to receive transfers
@JsonKey(name: 'can_receive') bool get canReceive;
/// Create a copy of KYCLookupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KYCLookupModelCopyWith<KYCLookupModel> get copyWith => _$KYCLookupModelCopyWithImpl<KYCLookupModel>(this as KYCLookupModel, _$identity);

  /// Serializes this KYCLookupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KYCLookupModel&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.pepCheck, pepCheck) || other.pepCheck == pepCheck)&&(identical(other.sanctionCheck, sanctionCheck) || other.sanctionCheck == sanctionCheck)&&(identical(other.adverseMedia, adverseMedia) || other.adverseMedia == adverseMedia)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.canReceive, canReceive) || other.canReceive == canReceive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,selfieUrl,status,level,riskScore,pepCheck,sanctionCheck,adverseMedia,expiresAt,canReceive);

@override
String toString() {
  return 'KYCLookupModel(email: $email, fullName: $fullName, selfieUrl: $selfieUrl, status: $status, level: $level, riskScore: $riskScore, pepCheck: $pepCheck, sanctionCheck: $sanctionCheck, adverseMedia: $adverseMedia, expiresAt: $expiresAt, canReceive: $canReceive)';
}


}

/// @nodoc
abstract mixin class $KYCLookupModelCopyWith<$Res>  {
  factory $KYCLookupModelCopyWith(KYCLookupModel value, $Res Function(KYCLookupModel) _then) = _$KYCLookupModelCopyWithImpl;
@useResult
$Res call({
 String email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'selfie_url') String? selfieUrl, String status, String level,@JsonKey(name: 'risk_score') int riskScore,@JsonKey(name: 'pep_check') bool pepCheck,@JsonKey(name: 'sanction_check') bool sanctionCheck,@JsonKey(name: 'adverse_media') bool adverseMedia,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'can_receive') bool canReceive
});




}
/// @nodoc
class _$KYCLookupModelCopyWithImpl<$Res>
    implements $KYCLookupModelCopyWith<$Res> {
  _$KYCLookupModelCopyWithImpl(this._self, this._then);

  final KYCLookupModel _self;
  final $Res Function(KYCLookupModel) _then;

/// Create a copy of KYCLookupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? fullName = freezed,Object? selfieUrl = freezed,Object? status = null,Object? level = null,Object? riskScore = null,Object? pepCheck = null,Object? sanctionCheck = null,Object? adverseMedia = null,Object? expiresAt = freezed,Object? canReceive = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,riskScore: null == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int,pepCheck: null == pepCheck ? _self.pepCheck : pepCheck // ignore: cast_nullable_to_non_nullable
as bool,sanctionCheck: null == sanctionCheck ? _self.sanctionCheck : sanctionCheck // ignore: cast_nullable_to_non_nullable
as bool,adverseMedia: null == adverseMedia ? _self.adverseMedia : adverseMedia // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canReceive: null == canReceive ? _self.canReceive : canReceive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [KYCLookupModel].
extension KYCLookupModelPatterns on KYCLookupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KYCLookupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KYCLookupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KYCLookupModel value)  $default,){
final _that = this;
switch (_that) {
case _KYCLookupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KYCLookupModel value)?  $default,){
final _that = this;
switch (_that) {
case _KYCLookupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'selfie_url')  String? selfieUrl,  String status,  String level, @JsonKey(name: 'risk_score')  int riskScore, @JsonKey(name: 'pep_check')  bool pepCheck, @JsonKey(name: 'sanction_check')  bool sanctionCheck, @JsonKey(name: 'adverse_media')  bool adverseMedia, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'can_receive')  bool canReceive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KYCLookupModel() when $default != null:
return $default(_that.email,_that.fullName,_that.selfieUrl,_that.status,_that.level,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.expiresAt,_that.canReceive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'selfie_url')  String? selfieUrl,  String status,  String level, @JsonKey(name: 'risk_score')  int riskScore, @JsonKey(name: 'pep_check')  bool pepCheck, @JsonKey(name: 'sanction_check')  bool sanctionCheck, @JsonKey(name: 'adverse_media')  bool adverseMedia, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'can_receive')  bool canReceive)  $default,) {final _that = this;
switch (_that) {
case _KYCLookupModel():
return $default(_that.email,_that.fullName,_that.selfieUrl,_that.status,_that.level,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.expiresAt,_that.canReceive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'selfie_url')  String? selfieUrl,  String status,  String level, @JsonKey(name: 'risk_score')  int riskScore, @JsonKey(name: 'pep_check')  bool pepCheck, @JsonKey(name: 'sanction_check')  bool sanctionCheck, @JsonKey(name: 'adverse_media')  bool adverseMedia, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'can_receive')  bool canReceive)?  $default,) {final _that = this;
switch (_that) {
case _KYCLookupModel() when $default != null:
return $default(_that.email,_that.fullName,_that.selfieUrl,_that.status,_that.level,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.expiresAt,_that.canReceive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KYCLookupModel implements KYCLookupModel {
  const _KYCLookupModel({required this.email, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'selfie_url') this.selfieUrl, required this.status, required this.level, @JsonKey(name: 'risk_score') required this.riskScore, @JsonKey(name: 'pep_check') required this.pepCheck, @JsonKey(name: 'sanction_check') required this.sanctionCheck, @JsonKey(name: 'adverse_media') required this.adverseMedia, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'can_receive') required this.canReceive});
  factory _KYCLookupModel.fromJson(Map<String, dynamic> json) => _$KYCLookupModelFromJson(json);

/// Recipient email
@override final  String email;
/// Verified full name
@override@JsonKey(name: 'full_name') final  String? fullName;
/// Selfie image URL
@override@JsonKey(name: 'selfie_url') final  String? selfieUrl;
/// NOT_STARTED, PENDING, VERIFIED, REJECTED, EXPIRED
@override final  String status;
/// BASIC, STANDARD, ADVANCED, FULL
@override final  String level;
/// Risk score (0–100)
@override@JsonKey(name: 'risk_score') final  int riskScore;
/// Politically exposed person flag
@override@JsonKey(name: 'pep_check') final  bool pepCheck;
/// Sanctions flag
@override@JsonKey(name: 'sanction_check') final  bool sanctionCheck;
/// Adverse media flag
@override@JsonKey(name: 'adverse_media') final  bool adverseMedia;
/// Expiry date
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
/// Whether allowed to receive transfers
@override@JsonKey(name: 'can_receive') final  bool canReceive;

/// Create a copy of KYCLookupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KYCLookupModelCopyWith<_KYCLookupModel> get copyWith => __$KYCLookupModelCopyWithImpl<_KYCLookupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KYCLookupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KYCLookupModel&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.pepCheck, pepCheck) || other.pepCheck == pepCheck)&&(identical(other.sanctionCheck, sanctionCheck) || other.sanctionCheck == sanctionCheck)&&(identical(other.adverseMedia, adverseMedia) || other.adverseMedia == adverseMedia)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.canReceive, canReceive) || other.canReceive == canReceive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,selfieUrl,status,level,riskScore,pepCheck,sanctionCheck,adverseMedia,expiresAt,canReceive);

@override
String toString() {
  return 'KYCLookupModel(email: $email, fullName: $fullName, selfieUrl: $selfieUrl, status: $status, level: $level, riskScore: $riskScore, pepCheck: $pepCheck, sanctionCheck: $sanctionCheck, adverseMedia: $adverseMedia, expiresAt: $expiresAt, canReceive: $canReceive)';
}


}

/// @nodoc
abstract mixin class _$KYCLookupModelCopyWith<$Res> implements $KYCLookupModelCopyWith<$Res> {
  factory _$KYCLookupModelCopyWith(_KYCLookupModel value, $Res Function(_KYCLookupModel) _then) = __$KYCLookupModelCopyWithImpl;
@override @useResult
$Res call({
 String email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'selfie_url') String? selfieUrl, String status, String level,@JsonKey(name: 'risk_score') int riskScore,@JsonKey(name: 'pep_check') bool pepCheck,@JsonKey(name: 'sanction_check') bool sanctionCheck,@JsonKey(name: 'adverse_media') bool adverseMedia,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'can_receive') bool canReceive
});




}
/// @nodoc
class __$KYCLookupModelCopyWithImpl<$Res>
    implements _$KYCLookupModelCopyWith<$Res> {
  __$KYCLookupModelCopyWithImpl(this._self, this._then);

  final _KYCLookupModel _self;
  final $Res Function(_KYCLookupModel) _then;

/// Create a copy of KYCLookupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? fullName = freezed,Object? selfieUrl = freezed,Object? status = null,Object? level = null,Object? riskScore = null,Object? pepCheck = null,Object? sanctionCheck = null,Object? adverseMedia = null,Object? expiresAt = freezed,Object? canReceive = null,}) {
  return _then(_KYCLookupModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,riskScore: null == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int,pepCheck: null == pepCheck ? _self.pepCheck : pepCheck // ignore: cast_nullable_to_non_nullable
as bool,sanctionCheck: null == sanctionCheck ? _self.sanctionCheck : sanctionCheck // ignore: cast_nullable_to_non_nullable
as bool,adverseMedia: null == adverseMedia ? _self.adverseMedia : adverseMedia // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canReceive: null == canReceive ? _self.canReceive : canReceive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
