// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KYCProfile {

 String get id; String get status; String get level;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'date_of_birth') DateTime? get dateOfBirth; String? get nationality;@JsonKey(name: 'id_type') String? get idType;@JsonKey(name: 'id_number') String? get idNumber;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'id_country') String? get idCountry;@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? get idExpiryDate;@JsonKey(name: 'address_line1') String? get addressLine1;@JsonKey(name: 'address_line2') String? get addressLine2; String? get city; String? get state;@JsonKey(name: 'postal_code') String? get postalCode; String? get country;@JsonKey(name: 'employment_status') String? get employmentStatus; String? get occupation; String? get employer;@JsonKey(name: 'annual_income') String? get annualIncome;@JsonKey(name: 'verified_at') DateTime? get verifiedAt;@JsonKey(name: 'id_front_url') String? get idFrontUrl;@JsonKey(name: 'id_back_url') String? get idBackUrl;@JsonKey(name: 'selfie_url') String? get selfieUrl;@JsonKey(name: 'proof_of_address_url') String? get proofOfAddressUrl;@JsonKey(name: 'proof_of_address_type') String? get proofOfAddressType;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'risk_score') int? get riskScore;@JsonKey(name: 'pep_check') bool? get pepCheck;@JsonKey(name: 'sanction_check') bool? get sanctionCheck;@JsonKey(name: 'adverse_media') bool? get adverseMedia;@JsonKey(name: 'user') UserModel? get user;@JsonKey(name: 'verified_by') String? get verifiedBy;
/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KYCProfileCopyWith<KYCProfile> get copyWith => _$KYCProfileCopyWithImpl<KYCProfile>(this as KYCProfile, _$identity);

  /// Serializes this KYCProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KYCProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCountry, idCountry) || other.idCountry == idCountry)&&(identical(other.idExpiryDate, idExpiryDate) || other.idExpiryDate == idExpiryDate)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.annualIncome, annualIncome) || other.annualIncome == annualIncome)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.idFrontUrl, idFrontUrl) || other.idFrontUrl == idFrontUrl)&&(identical(other.idBackUrl, idBackUrl) || other.idBackUrl == idBackUrl)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.proofOfAddressUrl, proofOfAddressUrl) || other.proofOfAddressUrl == proofOfAddressUrl)&&(identical(other.proofOfAddressType, proofOfAddressType) || other.proofOfAddressType == proofOfAddressType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.pepCheck, pepCheck) || other.pepCheck == pepCheck)&&(identical(other.sanctionCheck, sanctionCheck) || other.sanctionCheck == sanctionCheck)&&(identical(other.adverseMedia, adverseMedia) || other.adverseMedia == adverseMedia)&&(identical(other.user, user) || other.user == user)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,level,fullName,dateOfBirth,nationality,idType,idNumber,phoneNumber,idCountry,idExpiryDate,addressLine1,addressLine2,city,state,postalCode,country,employmentStatus,occupation,employer,annualIncome,verifiedAt,idFrontUrl,idBackUrl,selfieUrl,proofOfAddressUrl,proofOfAddressType,createdAt,updatedAt,expiresAt,rejectionReason,riskScore,pepCheck,sanctionCheck,adverseMedia,user,verifiedBy]);

@override
String toString() {
  return 'KYCProfile(id: $id, status: $status, level: $level, fullName: $fullName, dateOfBirth: $dateOfBirth, nationality: $nationality, idType: $idType, idNumber: $idNumber, phoneNumber: $phoneNumber, idCountry: $idCountry, idExpiryDate: $idExpiryDate, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, employmentStatus: $employmentStatus, occupation: $occupation, employer: $employer, annualIncome: $annualIncome, verifiedAt: $verifiedAt, idFrontUrl: $idFrontUrl, idBackUrl: $idBackUrl, selfieUrl: $selfieUrl, proofOfAddressUrl: $proofOfAddressUrl, proofOfAddressType: $proofOfAddressType, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, rejectionReason: $rejectionReason, riskScore: $riskScore, pepCheck: $pepCheck, sanctionCheck: $sanctionCheck, adverseMedia: $adverseMedia, user: $user, verifiedBy: $verifiedBy)';
}


}

/// @nodoc
abstract mixin class $KYCProfileCopyWith<$Res>  {
  factory $KYCProfileCopyWith(KYCProfile value, $Res Function(KYCProfile) _then) = _$KYCProfileCopyWithImpl;
@useResult
$Res call({
 String id, String status, String level,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth, String? nationality,@JsonKey(name: 'id_type') String? idType,@JsonKey(name: 'id_number') String? idNumber,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'id_country') String? idCountry,@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? idExpiryDate,@JsonKey(name: 'address_line1') String? addressLine1,@JsonKey(name: 'address_line2') String? addressLine2, String? city, String? state,@JsonKey(name: 'postal_code') String? postalCode, String? country,@JsonKey(name: 'employment_status') String? employmentStatus, String? occupation, String? employer,@JsonKey(name: 'annual_income') String? annualIncome,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'id_front_url') String? idFrontUrl,@JsonKey(name: 'id_back_url') String? idBackUrl,@JsonKey(name: 'selfie_url') String? selfieUrl,@JsonKey(name: 'proof_of_address_url') String? proofOfAddressUrl,@JsonKey(name: 'proof_of_address_type') String? proofOfAddressType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'risk_score') int? riskScore,@JsonKey(name: 'pep_check') bool? pepCheck,@JsonKey(name: 'sanction_check') bool? sanctionCheck,@JsonKey(name: 'adverse_media') bool? adverseMedia,@JsonKey(name: 'user') UserModel? user,@JsonKey(name: 'verified_by') String? verifiedBy
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$KYCProfileCopyWithImpl<$Res>
    implements $KYCProfileCopyWith<$Res> {
  _$KYCProfileCopyWithImpl(this._self, this._then);

  final KYCProfile _self;
  final $Res Function(KYCProfile) _then;

/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? level = null,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? nationality = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? phoneNumber = freezed,Object? idCountry = freezed,Object? idExpiryDate = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? country = freezed,Object? employmentStatus = freezed,Object? occupation = freezed,Object? employer = freezed,Object? annualIncome = freezed,Object? verifiedAt = freezed,Object? idFrontUrl = freezed,Object? idBackUrl = freezed,Object? selfieUrl = freezed,Object? proofOfAddressUrl = freezed,Object? proofOfAddressType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,Object? rejectionReason = freezed,Object? riskScore = freezed,Object? pepCheck = freezed,Object? sanctionCheck = freezed,Object? adverseMedia = freezed,Object? user = freezed,Object? verifiedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,idCountry: freezed == idCountry ? _self.idCountry : idCountry // ignore: cast_nullable_to_non_nullable
as String?,idExpiryDate: freezed == idExpiryDate ? _self.idExpiryDate : idExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,employmentStatus: freezed == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,annualIncome: freezed == annualIncome ? _self.annualIncome : annualIncome // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,idFrontUrl: freezed == idFrontUrl ? _self.idFrontUrl : idFrontUrl // ignore: cast_nullable_to_non_nullable
as String?,idBackUrl: freezed == idBackUrl ? _self.idBackUrl : idBackUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,proofOfAddressUrl: freezed == proofOfAddressUrl ? _self.proofOfAddressUrl : proofOfAddressUrl // ignore: cast_nullable_to_non_nullable
as String?,proofOfAddressType: freezed == proofOfAddressType ? _self.proofOfAddressType : proofOfAddressType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,pepCheck: freezed == pepCheck ? _self.pepCheck : pepCheck // ignore: cast_nullable_to_non_nullable
as bool?,sanctionCheck: freezed == sanctionCheck ? _self.sanctionCheck : sanctionCheck // ignore: cast_nullable_to_non_nullable
as bool?,adverseMedia: freezed == adverseMedia ? _self.adverseMedia : adverseMedia // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [KYCProfile].
extension KYCProfilePatterns on KYCProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KYCProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KYCProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KYCProfile value)  $default,){
final _that = this;
switch (_that) {
case _KYCProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KYCProfile value)?  $default,){
final _that = this;
switch (_that) {
case _KYCProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String level, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth,  String? nationality, @JsonKey(name: 'id_type')  String? idType, @JsonKey(name: 'id_number')  String? idNumber, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'id_country')  String? idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String? addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String? city,  String? state, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'id_front_url')  String? idFrontUrl, @JsonKey(name: 'id_back_url')  String? idBackUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl, @JsonKey(name: 'proof_of_address_url')  String? proofOfAddressUrl, @JsonKey(name: 'proof_of_address_type')  String? proofOfAddressType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'pep_check')  bool? pepCheck, @JsonKey(name: 'sanction_check')  bool? sanctionCheck, @JsonKey(name: 'adverse_media')  bool? adverseMedia, @JsonKey(name: 'user')  UserModel? user, @JsonKey(name: 'verified_by')  String? verifiedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KYCProfile() when $default != null:
return $default(_that.id,_that.status,_that.level,_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome,_that.verifiedAt,_that.idFrontUrl,_that.idBackUrl,_that.selfieUrl,_that.proofOfAddressUrl,_that.proofOfAddressType,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.rejectionReason,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.user,_that.verifiedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String level, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth,  String? nationality, @JsonKey(name: 'id_type')  String? idType, @JsonKey(name: 'id_number')  String? idNumber, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'id_country')  String? idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String? addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String? city,  String? state, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'id_front_url')  String? idFrontUrl, @JsonKey(name: 'id_back_url')  String? idBackUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl, @JsonKey(name: 'proof_of_address_url')  String? proofOfAddressUrl, @JsonKey(name: 'proof_of_address_type')  String? proofOfAddressType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'pep_check')  bool? pepCheck, @JsonKey(name: 'sanction_check')  bool? sanctionCheck, @JsonKey(name: 'adverse_media')  bool? adverseMedia, @JsonKey(name: 'user')  UserModel? user, @JsonKey(name: 'verified_by')  String? verifiedBy)  $default,) {final _that = this;
switch (_that) {
case _KYCProfile():
return $default(_that.id,_that.status,_that.level,_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome,_that.verifiedAt,_that.idFrontUrl,_that.idBackUrl,_that.selfieUrl,_that.proofOfAddressUrl,_that.proofOfAddressType,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.rejectionReason,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.user,_that.verifiedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String level, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'date_of_birth')  DateTime? dateOfBirth,  String? nationality, @JsonKey(name: 'id_type')  String? idType, @JsonKey(name: 'id_number')  String? idNumber, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'id_country')  String? idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String? addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String? city,  String? state, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'id_front_url')  String? idFrontUrl, @JsonKey(name: 'id_back_url')  String? idBackUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl, @JsonKey(name: 'proof_of_address_url')  String? proofOfAddressUrl, @JsonKey(name: 'proof_of_address_type')  String? proofOfAddressType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'risk_score')  int? riskScore, @JsonKey(name: 'pep_check')  bool? pepCheck, @JsonKey(name: 'sanction_check')  bool? sanctionCheck, @JsonKey(name: 'adverse_media')  bool? adverseMedia, @JsonKey(name: 'user')  UserModel? user, @JsonKey(name: 'verified_by')  String? verifiedBy)?  $default,) {final _that = this;
switch (_that) {
case _KYCProfile() when $default != null:
return $default(_that.id,_that.status,_that.level,_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome,_that.verifiedAt,_that.idFrontUrl,_that.idBackUrl,_that.selfieUrl,_that.proofOfAddressUrl,_that.proofOfAddressType,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.rejectionReason,_that.riskScore,_that.pepCheck,_that.sanctionCheck,_that.adverseMedia,_that.user,_that.verifiedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KYCProfile implements KYCProfile {
  const _KYCProfile({required this.id, required this.status, required this.level, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.nationality, @JsonKey(name: 'id_type') this.idType, @JsonKey(name: 'id_number') this.idNumber, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'id_country') this.idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() this.idExpiryDate, @JsonKey(name: 'address_line1') this.addressLine1, @JsonKey(name: 'address_line2') this.addressLine2, this.city, this.state, @JsonKey(name: 'postal_code') this.postalCode, this.country, @JsonKey(name: 'employment_status') this.employmentStatus, this.occupation, this.employer, @JsonKey(name: 'annual_income') this.annualIncome, @JsonKey(name: 'verified_at') this.verifiedAt, @JsonKey(name: 'id_front_url') this.idFrontUrl, @JsonKey(name: 'id_back_url') this.idBackUrl, @JsonKey(name: 'selfie_url') this.selfieUrl, @JsonKey(name: 'proof_of_address_url') this.proofOfAddressUrl, @JsonKey(name: 'proof_of_address_type') this.proofOfAddressType, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'risk_score') this.riskScore, @JsonKey(name: 'pep_check') this.pepCheck, @JsonKey(name: 'sanction_check') this.sanctionCheck, @JsonKey(name: 'adverse_media') this.adverseMedia, @JsonKey(name: 'user') this.user, @JsonKey(name: 'verified_by') this.verifiedBy});
  factory _KYCProfile.fromJson(Map<String, dynamic> json) => _$KYCProfileFromJson(json);

@override final  String id;
@override final  String status;
@override final  String level;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'date_of_birth') final  DateTime? dateOfBirth;
@override final  String? nationality;
@override@JsonKey(name: 'id_type') final  String? idType;
@override@JsonKey(name: 'id_number') final  String? idNumber;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'id_country') final  String? idCountry;
@override@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() final  DateTime? idExpiryDate;
@override@JsonKey(name: 'address_line1') final  String? addressLine1;
@override@JsonKey(name: 'address_line2') final  String? addressLine2;
@override final  String? city;
@override final  String? state;
@override@JsonKey(name: 'postal_code') final  String? postalCode;
@override final  String? country;
@override@JsonKey(name: 'employment_status') final  String? employmentStatus;
@override final  String? occupation;
@override final  String? employer;
@override@JsonKey(name: 'annual_income') final  String? annualIncome;
@override@JsonKey(name: 'verified_at') final  DateTime? verifiedAt;
@override@JsonKey(name: 'id_front_url') final  String? idFrontUrl;
@override@JsonKey(name: 'id_back_url') final  String? idBackUrl;
@override@JsonKey(name: 'selfie_url') final  String? selfieUrl;
@override@JsonKey(name: 'proof_of_address_url') final  String? proofOfAddressUrl;
@override@JsonKey(name: 'proof_of_address_type') final  String? proofOfAddressType;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'risk_score') final  int? riskScore;
@override@JsonKey(name: 'pep_check') final  bool? pepCheck;
@override@JsonKey(name: 'sanction_check') final  bool? sanctionCheck;
@override@JsonKey(name: 'adverse_media') final  bool? adverseMedia;
@override@JsonKey(name: 'user') final  UserModel? user;
@override@JsonKey(name: 'verified_by') final  String? verifiedBy;

/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KYCProfileCopyWith<_KYCProfile> get copyWith => __$KYCProfileCopyWithImpl<_KYCProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KYCProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KYCProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCountry, idCountry) || other.idCountry == idCountry)&&(identical(other.idExpiryDate, idExpiryDate) || other.idExpiryDate == idExpiryDate)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.annualIncome, annualIncome) || other.annualIncome == annualIncome)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.idFrontUrl, idFrontUrl) || other.idFrontUrl == idFrontUrl)&&(identical(other.idBackUrl, idBackUrl) || other.idBackUrl == idBackUrl)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.proofOfAddressUrl, proofOfAddressUrl) || other.proofOfAddressUrl == proofOfAddressUrl)&&(identical(other.proofOfAddressType, proofOfAddressType) || other.proofOfAddressType == proofOfAddressType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.riskScore, riskScore) || other.riskScore == riskScore)&&(identical(other.pepCheck, pepCheck) || other.pepCheck == pepCheck)&&(identical(other.sanctionCheck, sanctionCheck) || other.sanctionCheck == sanctionCheck)&&(identical(other.adverseMedia, adverseMedia) || other.adverseMedia == adverseMedia)&&(identical(other.user, user) || other.user == user)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,level,fullName,dateOfBirth,nationality,idType,idNumber,phoneNumber,idCountry,idExpiryDate,addressLine1,addressLine2,city,state,postalCode,country,employmentStatus,occupation,employer,annualIncome,verifiedAt,idFrontUrl,idBackUrl,selfieUrl,proofOfAddressUrl,proofOfAddressType,createdAt,updatedAt,expiresAt,rejectionReason,riskScore,pepCheck,sanctionCheck,adverseMedia,user,verifiedBy]);

@override
String toString() {
  return 'KYCProfile(id: $id, status: $status, level: $level, fullName: $fullName, dateOfBirth: $dateOfBirth, nationality: $nationality, idType: $idType, idNumber: $idNumber, phoneNumber: $phoneNumber, idCountry: $idCountry, idExpiryDate: $idExpiryDate, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, employmentStatus: $employmentStatus, occupation: $occupation, employer: $employer, annualIncome: $annualIncome, verifiedAt: $verifiedAt, idFrontUrl: $idFrontUrl, idBackUrl: $idBackUrl, selfieUrl: $selfieUrl, proofOfAddressUrl: $proofOfAddressUrl, proofOfAddressType: $proofOfAddressType, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, rejectionReason: $rejectionReason, riskScore: $riskScore, pepCheck: $pepCheck, sanctionCheck: $sanctionCheck, adverseMedia: $adverseMedia, user: $user, verifiedBy: $verifiedBy)';
}


}

/// @nodoc
abstract mixin class _$KYCProfileCopyWith<$Res> implements $KYCProfileCopyWith<$Res> {
  factory _$KYCProfileCopyWith(_KYCProfile value, $Res Function(_KYCProfile) _then) = __$KYCProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String level,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'date_of_birth') DateTime? dateOfBirth, String? nationality,@JsonKey(name: 'id_type') String? idType,@JsonKey(name: 'id_number') String? idNumber,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'id_country') String? idCountry,@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? idExpiryDate,@JsonKey(name: 'address_line1') String? addressLine1,@JsonKey(name: 'address_line2') String? addressLine2, String? city, String? state,@JsonKey(name: 'postal_code') String? postalCode, String? country,@JsonKey(name: 'employment_status') String? employmentStatus, String? occupation, String? employer,@JsonKey(name: 'annual_income') String? annualIncome,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'id_front_url') String? idFrontUrl,@JsonKey(name: 'id_back_url') String? idBackUrl,@JsonKey(name: 'selfie_url') String? selfieUrl,@JsonKey(name: 'proof_of_address_url') String? proofOfAddressUrl,@JsonKey(name: 'proof_of_address_type') String? proofOfAddressType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'risk_score') int? riskScore,@JsonKey(name: 'pep_check') bool? pepCheck,@JsonKey(name: 'sanction_check') bool? sanctionCheck,@JsonKey(name: 'adverse_media') bool? adverseMedia,@JsonKey(name: 'user') UserModel? user,@JsonKey(name: 'verified_by') String? verifiedBy
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$KYCProfileCopyWithImpl<$Res>
    implements _$KYCProfileCopyWith<$Res> {
  __$KYCProfileCopyWithImpl(this._self, this._then);

  final _KYCProfile _self;
  final $Res Function(_KYCProfile) _then;

/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? level = null,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? nationality = freezed,Object? idType = freezed,Object? idNumber = freezed,Object? phoneNumber = freezed,Object? idCountry = freezed,Object? idExpiryDate = freezed,Object? addressLine1 = freezed,Object? addressLine2 = freezed,Object? city = freezed,Object? state = freezed,Object? postalCode = freezed,Object? country = freezed,Object? employmentStatus = freezed,Object? occupation = freezed,Object? employer = freezed,Object? annualIncome = freezed,Object? verifiedAt = freezed,Object? idFrontUrl = freezed,Object? idBackUrl = freezed,Object? selfieUrl = freezed,Object? proofOfAddressUrl = freezed,Object? proofOfAddressType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,Object? rejectionReason = freezed,Object? riskScore = freezed,Object? pepCheck = freezed,Object? sanctionCheck = freezed,Object? adverseMedia = freezed,Object? user = freezed,Object? verifiedBy = freezed,}) {
  return _then(_KYCProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,idType: freezed == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String?,idNumber: freezed == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,idCountry: freezed == idCountry ? _self.idCountry : idCountry // ignore: cast_nullable_to_non_nullable
as String?,idExpiryDate: freezed == idExpiryDate ? _self.idExpiryDate : idExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addressLine1: freezed == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String?,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,employmentStatus: freezed == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,annualIncome: freezed == annualIncome ? _self.annualIncome : annualIncome // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,idFrontUrl: freezed == idFrontUrl ? _self.idFrontUrl : idFrontUrl // ignore: cast_nullable_to_non_nullable
as String?,idBackUrl: freezed == idBackUrl ? _self.idBackUrl : idBackUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,proofOfAddressUrl: freezed == proofOfAddressUrl ? _self.proofOfAddressUrl : proofOfAddressUrl // ignore: cast_nullable_to_non_nullable
as String?,proofOfAddressType: freezed == proofOfAddressType ? _self.proofOfAddressType : proofOfAddressType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,riskScore: freezed == riskScore ? _self.riskScore : riskScore // ignore: cast_nullable_to_non_nullable
as int?,pepCheck: freezed == pepCheck ? _self.pepCheck : pepCheck // ignore: cast_nullable_to_non_nullable
as bool?,sanctionCheck: freezed == sanctionCheck ? _self.sanctionCheck : sanctionCheck // ignore: cast_nullable_to_non_nullable
as bool?,adverseMedia: freezed == adverseMedia ? _self.adverseMedia : adverseMedia // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of KYCProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$KYCStatus {

 String get status; String get level;@JsonKey(name: 'is_verified') bool get isVerified;@JsonKey(name: 'submitted_at') DateTime? get submittedAt;@JsonKey(name: 'verified_at') DateTime? get verifiedAt;@JsonKey(name: 'expires_at') DateTime? get expiresAt;
/// Create a copy of KYCStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KYCStatusCopyWith<KYCStatus> get copyWith => _$KYCStatusCopyWithImpl<KYCStatus>(this as KYCStatus, _$identity);

  /// Serializes this KYCStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KYCStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,level,isVerified,submittedAt,verifiedAt,expiresAt);

@override
String toString() {
  return 'KYCStatus(status: $status, level: $level, isVerified: $isVerified, submittedAt: $submittedAt, verifiedAt: $verifiedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $KYCStatusCopyWith<$Res>  {
  factory $KYCStatusCopyWith(KYCStatus value, $Res Function(KYCStatus) _then) = _$KYCStatusCopyWithImpl;
@useResult
$Res call({
 String status, String level,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'submitted_at') DateTime? submittedAt,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt
});




}
/// @nodoc
class _$KYCStatusCopyWithImpl<$Res>
    implements $KYCStatusCopyWith<$Res> {
  _$KYCStatusCopyWithImpl(this._self, this._then);

  final KYCStatus _self;
  final $Res Function(KYCStatus) _then;

/// Create a copy of KYCStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? level = null,Object? isVerified = null,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [KYCStatus].
extension KYCStatusPatterns on KYCStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KYCStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KYCStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KYCStatus value)  $default,){
final _that = this;
switch (_that) {
case _KYCStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KYCStatus value)?  $default,){
final _that = this;
switch (_that) {
case _KYCStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String level, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KYCStatus() when $default != null:
return $default(_that.status,_that.level,_that.isVerified,_that.submittedAt,_that.verifiedAt,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String level, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _KYCStatus():
return $default(_that.status,_that.level,_that.isVerified,_that.submittedAt,_that.verifiedAt,_that.expiresAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String level, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'submitted_at')  DateTime? submittedAt, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'expires_at')  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _KYCStatus() when $default != null:
return $default(_that.status,_that.level,_that.isVerified,_that.submittedAt,_that.verifiedAt,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KYCStatus implements KYCStatus {
  const _KYCStatus({required this.status, required this.level, @JsonKey(name: 'is_verified') required this.isVerified, @JsonKey(name: 'submitted_at') this.submittedAt, @JsonKey(name: 'verified_at') this.verifiedAt, @JsonKey(name: 'expires_at') this.expiresAt});
  factory _KYCStatus.fromJson(Map<String, dynamic> json) => _$KYCStatusFromJson(json);

@override final  String status;
@override final  String level;
@override@JsonKey(name: 'is_verified') final  bool isVerified;
@override@JsonKey(name: 'submitted_at') final  DateTime? submittedAt;
@override@JsonKey(name: 'verified_at') final  DateTime? verifiedAt;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;

/// Create a copy of KYCStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KYCStatusCopyWith<_KYCStatus> get copyWith => __$KYCStatusCopyWithImpl<_KYCStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KYCStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KYCStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.level, level) || other.level == level)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,level,isVerified,submittedAt,verifiedAt,expiresAt);

@override
String toString() {
  return 'KYCStatus(status: $status, level: $level, isVerified: $isVerified, submittedAt: $submittedAt, verifiedAt: $verifiedAt, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$KYCStatusCopyWith<$Res> implements $KYCStatusCopyWith<$Res> {
  factory _$KYCStatusCopyWith(_KYCStatus value, $Res Function(_KYCStatus) _then) = __$KYCStatusCopyWithImpl;
@override @useResult
$Res call({
 String status, String level,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'submitted_at') DateTime? submittedAt,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'expires_at') DateTime? expiresAt
});




}
/// @nodoc
class __$KYCStatusCopyWithImpl<$Res>
    implements _$KYCStatusCopyWith<$Res> {
  __$KYCStatusCopyWithImpl(this._self, this._then);

  final _KYCStatus _self;
  final $Res Function(_KYCStatus) _then;

/// Create a copy of KYCStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? level = null,Object? isVerified = null,Object? submittedAt = freezed,Object? verifiedAt = freezed,Object? expiresAt = freezed,}) {
  return _then(_KYCStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$KYCSubmission {

@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'date_of_birth')@DateOnlyConverter() DateTime get dateOfBirth; String get nationality;@JsonKey(name: 'id_type') String get idType;@JsonKey(name: 'id_number') String get idNumber;@JsonKey(name: 'phone_number') String get phoneNumber;@JsonKey(name: 'id_country') String get idCountry;@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? get idExpiryDate;@JsonKey(name: 'address_line1') String get addressLine1;@JsonKey(name: 'address_line2') String? get addressLine2; String get city; String get state;@JsonKey(name: 'postal_code') String get postalCode; String get country;@JsonKey(name: 'employment_status') String? get employmentStatus; String? get occupation; String? get employer;@JsonKey(name: 'annual_income') String? get annualIncome;
/// Create a copy of KYCSubmission
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KYCSubmissionCopyWith<KYCSubmission> get copyWith => _$KYCSubmissionCopyWithImpl<KYCSubmission>(this as KYCSubmission, _$identity);

  /// Serializes this KYCSubmission to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KYCSubmission&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCountry, idCountry) || other.idCountry == idCountry)&&(identical(other.idExpiryDate, idExpiryDate) || other.idExpiryDate == idExpiryDate)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.annualIncome, annualIncome) || other.annualIncome == annualIncome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dateOfBirth,nationality,idType,idNumber,phoneNumber,idCountry,idExpiryDate,addressLine1,addressLine2,city,state,postalCode,country,employmentStatus,occupation,employer,annualIncome);

@override
String toString() {
  return 'KYCSubmission(fullName: $fullName, dateOfBirth: $dateOfBirth, nationality: $nationality, idType: $idType, idNumber: $idNumber, phoneNumber: $phoneNumber, idCountry: $idCountry, idExpiryDate: $idExpiryDate, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, employmentStatus: $employmentStatus, occupation: $occupation, employer: $employer, annualIncome: $annualIncome)';
}


}

/// @nodoc
abstract mixin class $KYCSubmissionCopyWith<$Res>  {
  factory $KYCSubmissionCopyWith(KYCSubmission value, $Res Function(KYCSubmission) _then) = _$KYCSubmissionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth')@DateOnlyConverter() DateTime dateOfBirth, String nationality,@JsonKey(name: 'id_type') String idType,@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'id_country') String idCountry,@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? idExpiryDate,@JsonKey(name: 'address_line1') String addressLine1,@JsonKey(name: 'address_line2') String? addressLine2, String city, String state,@JsonKey(name: 'postal_code') String postalCode, String country,@JsonKey(name: 'employment_status') String? employmentStatus, String? occupation, String? employer,@JsonKey(name: 'annual_income') String? annualIncome
});




}
/// @nodoc
class _$KYCSubmissionCopyWithImpl<$Res>
    implements $KYCSubmissionCopyWith<$Res> {
  _$KYCSubmissionCopyWithImpl(this._self, this._then);

  final KYCSubmission _self;
  final $Res Function(KYCSubmission) _then;

/// Create a copy of KYCSubmission
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? dateOfBirth = null,Object? nationality = null,Object? idType = null,Object? idNumber = null,Object? phoneNumber = null,Object? idCountry = null,Object? idExpiryDate = freezed,Object? addressLine1 = null,Object? addressLine2 = freezed,Object? city = null,Object? state = null,Object? postalCode = null,Object? country = null,Object? employmentStatus = freezed,Object? occupation = freezed,Object? employer = freezed,Object? annualIncome = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,idCountry: null == idCountry ? _self.idCountry : idCountry // ignore: cast_nullable_to_non_nullable
as String,idExpiryDate: freezed == idExpiryDate ? _self.idExpiryDate : idExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,employmentStatus: freezed == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,annualIncome: freezed == annualIncome ? _self.annualIncome : annualIncome // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KYCSubmission].
extension KYCSubmissionPatterns on KYCSubmission {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KYCSubmission value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KYCSubmission() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KYCSubmission value)  $default,){
final _that = this;
switch (_that) {
case _KYCSubmission():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KYCSubmission value)?  $default,){
final _that = this;
switch (_that) {
case _KYCSubmission() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')@DateOnlyConverter()  DateTime dateOfBirth,  String nationality, @JsonKey(name: 'id_type')  String idType, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'id_country')  String idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String city,  String state, @JsonKey(name: 'postal_code')  String postalCode,  String country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KYCSubmission() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')@DateOnlyConverter()  DateTime dateOfBirth,  String nationality, @JsonKey(name: 'id_type')  String idType, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'id_country')  String idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String city,  String state, @JsonKey(name: 'postal_code')  String postalCode,  String country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome)  $default,) {final _that = this;
switch (_that) {
case _KYCSubmission():
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')@DateOnlyConverter()  DateTime dateOfBirth,  String nationality, @JsonKey(name: 'id_type')  String idType, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'phone_number')  String phoneNumber, @JsonKey(name: 'id_country')  String idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter()  DateTime? idExpiryDate, @JsonKey(name: 'address_line1')  String addressLine1, @JsonKey(name: 'address_line2')  String? addressLine2,  String city,  String state, @JsonKey(name: 'postal_code')  String postalCode,  String country, @JsonKey(name: 'employment_status')  String? employmentStatus,  String? occupation,  String? employer, @JsonKey(name: 'annual_income')  String? annualIncome)?  $default,) {final _that = this;
switch (_that) {
case _KYCSubmission() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.idType,_that.idNumber,_that.phoneNumber,_that.idCountry,_that.idExpiryDate,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.postalCode,_that.country,_that.employmentStatus,_that.occupation,_that.employer,_that.annualIncome);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KYCSubmission implements KYCSubmission {
  const _KYCSubmission({@JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'date_of_birth')@DateOnlyConverter() required this.dateOfBirth, required this.nationality, @JsonKey(name: 'id_type') required this.idType, @JsonKey(name: 'id_number') required this.idNumber, @JsonKey(name: 'phone_number') required this.phoneNumber, @JsonKey(name: 'id_country') required this.idCountry, @JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() this.idExpiryDate, @JsonKey(name: 'address_line1') required this.addressLine1, @JsonKey(name: 'address_line2') this.addressLine2, required this.city, required this.state, @JsonKey(name: 'postal_code') required this.postalCode, required this.country, @JsonKey(name: 'employment_status') this.employmentStatus, this.occupation, this.employer, @JsonKey(name: 'annual_income') this.annualIncome});
  factory _KYCSubmission.fromJson(Map<String, dynamic> json) => _$KYCSubmissionFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'date_of_birth')@DateOnlyConverter() final  DateTime dateOfBirth;
@override final  String nationality;
@override@JsonKey(name: 'id_type') final  String idType;
@override@JsonKey(name: 'id_number') final  String idNumber;
@override@JsonKey(name: 'phone_number') final  String phoneNumber;
@override@JsonKey(name: 'id_country') final  String idCountry;
@override@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() final  DateTime? idExpiryDate;
@override@JsonKey(name: 'address_line1') final  String addressLine1;
@override@JsonKey(name: 'address_line2') final  String? addressLine2;
@override final  String city;
@override final  String state;
@override@JsonKey(name: 'postal_code') final  String postalCode;
@override final  String country;
@override@JsonKey(name: 'employment_status') final  String? employmentStatus;
@override final  String? occupation;
@override final  String? employer;
@override@JsonKey(name: 'annual_income') final  String? annualIncome;

/// Create a copy of KYCSubmission
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KYCSubmissionCopyWith<_KYCSubmission> get copyWith => __$KYCSubmissionCopyWithImpl<_KYCSubmission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KYCSubmissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KYCSubmission&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.idType, idType) || other.idType == idType)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.idCountry, idCountry) || other.idCountry == idCountry)&&(identical(other.idExpiryDate, idExpiryDate) || other.idExpiryDate == idExpiryDate)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.employmentStatus, employmentStatus) || other.employmentStatus == employmentStatus)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.annualIncome, annualIncome) || other.annualIncome == annualIncome));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,dateOfBirth,nationality,idType,idNumber,phoneNumber,idCountry,idExpiryDate,addressLine1,addressLine2,city,state,postalCode,country,employmentStatus,occupation,employer,annualIncome);

@override
String toString() {
  return 'KYCSubmission(fullName: $fullName, dateOfBirth: $dateOfBirth, nationality: $nationality, idType: $idType, idNumber: $idNumber, phoneNumber: $phoneNumber, idCountry: $idCountry, idExpiryDate: $idExpiryDate, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, employmentStatus: $employmentStatus, occupation: $occupation, employer: $employer, annualIncome: $annualIncome)';
}


}

/// @nodoc
abstract mixin class _$KYCSubmissionCopyWith<$Res> implements $KYCSubmissionCopyWith<$Res> {
  factory _$KYCSubmissionCopyWith(_KYCSubmission value, $Res Function(_KYCSubmission) _then) = __$KYCSubmissionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth')@DateOnlyConverter() DateTime dateOfBirth, String nationality,@JsonKey(name: 'id_type') String idType,@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'phone_number') String phoneNumber,@JsonKey(name: 'id_country') String idCountry,@JsonKey(name: 'id_expiry_date')@NullableDateOnlyConverter() DateTime? idExpiryDate,@JsonKey(name: 'address_line1') String addressLine1,@JsonKey(name: 'address_line2') String? addressLine2, String city, String state,@JsonKey(name: 'postal_code') String postalCode, String country,@JsonKey(name: 'employment_status') String? employmentStatus, String? occupation, String? employer,@JsonKey(name: 'annual_income') String? annualIncome
});




}
/// @nodoc
class __$KYCSubmissionCopyWithImpl<$Res>
    implements _$KYCSubmissionCopyWith<$Res> {
  __$KYCSubmissionCopyWithImpl(this._self, this._then);

  final _KYCSubmission _self;
  final $Res Function(_KYCSubmission) _then;

/// Create a copy of KYCSubmission
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? dateOfBirth = null,Object? nationality = null,Object? idType = null,Object? idNumber = null,Object? phoneNumber = null,Object? idCountry = null,Object? idExpiryDate = freezed,Object? addressLine1 = null,Object? addressLine2 = freezed,Object? city = null,Object? state = null,Object? postalCode = null,Object? country = null,Object? employmentStatus = freezed,Object? occupation = freezed,Object? employer = freezed,Object? annualIncome = freezed,}) {
  return _then(_KYCSubmission(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,nationality: null == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String,idType: null == idType ? _self.idType : idType // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,idCountry: null == idCountry ? _self.idCountry : idCountry // ignore: cast_nullable_to_non_nullable
as String,idExpiryDate: freezed == idExpiryDate ? _self.idExpiryDate : idExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,employmentStatus: freezed == employmentStatus ? _self.employmentStatus : employmentStatus // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,annualIncome: freezed == annualIncome ? _self.annualIncome : annualIncome // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
