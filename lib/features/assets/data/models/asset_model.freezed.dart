// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetModel {

 String get id; String get title; String? get description;/// Category (Detail serializer)
@JsonKey(name: 'category') AssetCategoryModel? get category;@JsonKey(name: 'category_name') String? get categoryName;/// Category (Create serializer)
@JsonKey(name: 'category_details') AssetCategoryModel? get categoryDetails;/// Sensitive info
@JsonKey(name: 'serial_number') String? get serialNumber;@JsonKey(name: 'registration_number') String? get registrationNumber; String? get vin;/// Financials
@JsonKey(name: 'purchase_date') DateTime? get purchaseDate;@JsonKey(name: 'purchase_price', fromJson: _stringToDouble) double? get purchasePrice;@JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired) double get currentMarketValue;// @JsonKey(
//   name: 'collateral_value',
//   fromJson: _stringToDoubleRequired,
// )
// required double collateralValue,
/// Condition
@JsonKey(name: 'age_years', fromJson: _stringToDouble) double? get ageYears; String get condition;@JsonKey(name: 'condition_score') int? get conditionScore;/// Location
@JsonKey(name: 'location_address') String? get locationAddress;/// Loan tracking
@JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble) double? get outstandingLoanAmount;@JsonKey(name: 'loan_to_value', fromJson: _stringToDouble) double? get loanToValue;@JsonKey(name: 'available_equity', fromJson: _stringToDouble) double? get availableEquity;/// Verification
@JsonKey(name: 'verification_status') String get verificationStatus;@JsonKey(name: 'rejection_reasons') Map<String, dynamic>? get rejectionReasons;@JsonKey(name: 'verified_by') String? get verifiedBy;@JsonKey(name: 'verified_at') DateTime? get verifiedAt;/// Audit
@JsonKey(name: 'resubmission_count') int? get resubmissionCount;@JsonKey(name: 'last_submitted_at') DateTime? get lastSubmittedAt;/// Documents
 List<AssetDocumentModel>? get documents;/// Insurance
@JsonKey(name: 'insurance_policy') InsurancePolicyModel? get insurancePolicy;@JsonKey(name: 'has_active_insurance') bool? get hasActiveInsurance;@JsonKey(name: 'is_externally_encumbered') bool get isExternallyEncumbered;@JsonKey(name: 'external_lender_name') String? get externalLenderName;@JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble) double? get externalLienAmount;/// Timestamps
@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetModelCopyWith<AssetModel> get copyWith => _$AssetModelCopyWithImpl<AssetModel>(this as AssetModel, _$identity);

  /// Serializes this AssetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryDetails, categoryDetails) || other.categoryDetails == categoryDetails)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.currentMarketValue, currentMarketValue) || other.currentMarketValue == currentMarketValue)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.conditionScore, conditionScore) || other.conditionScore == conditionScore)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.outstandingLoanAmount, outstandingLoanAmount) || other.outstandingLoanAmount == outstandingLoanAmount)&&(identical(other.loanToValue, loanToValue) || other.loanToValue == loanToValue)&&(identical(other.availableEquity, availableEquity) || other.availableEquity == availableEquity)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&const DeepCollectionEquality().equals(other.rejectionReasons, rejectionReasons)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.resubmissionCount, resubmissionCount) || other.resubmissionCount == resubmissionCount)&&(identical(other.lastSubmittedAt, lastSubmittedAt) || other.lastSubmittedAt == lastSubmittedAt)&&const DeepCollectionEquality().equals(other.documents, documents)&&(identical(other.insurancePolicy, insurancePolicy) || other.insurancePolicy == insurancePolicy)&&(identical(other.hasActiveInsurance, hasActiveInsurance) || other.hasActiveInsurance == hasActiveInsurance)&&(identical(other.isExternallyEncumbered, isExternallyEncumbered) || other.isExternallyEncumbered == isExternallyEncumbered)&&(identical(other.externalLenderName, externalLenderName) || other.externalLenderName == externalLenderName)&&(identical(other.externalLienAmount, externalLienAmount) || other.externalLienAmount == externalLienAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,category,categoryName,categoryDetails,serialNumber,registrationNumber,vin,purchaseDate,purchasePrice,currentMarketValue,ageYears,condition,conditionScore,locationAddress,outstandingLoanAmount,loanToValue,availableEquity,verificationStatus,const DeepCollectionEquality().hash(rejectionReasons),verifiedBy,verifiedAt,resubmissionCount,lastSubmittedAt,const DeepCollectionEquality().hash(documents),insurancePolicy,hasActiveInsurance,isExternallyEncumbered,externalLenderName,externalLienAmount,createdAt,updatedAt]);

@override
String toString() {
  return 'AssetModel(id: $id, title: $title, description: $description, category: $category, categoryName: $categoryName, categoryDetails: $categoryDetails, serialNumber: $serialNumber, registrationNumber: $registrationNumber, vin: $vin, purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, currentMarketValue: $currentMarketValue, ageYears: $ageYears, condition: $condition, conditionScore: $conditionScore, locationAddress: $locationAddress, outstandingLoanAmount: $outstandingLoanAmount, loanToValue: $loanToValue, availableEquity: $availableEquity, verificationStatus: $verificationStatus, rejectionReasons: $rejectionReasons, verifiedBy: $verifiedBy, verifiedAt: $verifiedAt, resubmissionCount: $resubmissionCount, lastSubmittedAt: $lastSubmittedAt, documents: $documents, insurancePolicy: $insurancePolicy, hasActiveInsurance: $hasActiveInsurance, isExternallyEncumbered: $isExternallyEncumbered, externalLenderName: $externalLenderName, externalLienAmount: $externalLienAmount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AssetModelCopyWith<$Res>  {
  factory $AssetModelCopyWith(AssetModel value, $Res Function(AssetModel) _then) = _$AssetModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'category') AssetCategoryModel? category,@JsonKey(name: 'category_name') String? categoryName,@JsonKey(name: 'category_details') AssetCategoryModel? categoryDetails,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'registration_number') String? registrationNumber, String? vin,@JsonKey(name: 'purchase_date') DateTime? purchaseDate,@JsonKey(name: 'purchase_price', fromJson: _stringToDouble) double? purchasePrice,@JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired) double currentMarketValue,@JsonKey(name: 'age_years', fromJson: _stringToDouble) double? ageYears, String condition,@JsonKey(name: 'condition_score') int? conditionScore,@JsonKey(name: 'location_address') String? locationAddress,@JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble) double? outstandingLoanAmount,@JsonKey(name: 'loan_to_value', fromJson: _stringToDouble) double? loanToValue,@JsonKey(name: 'available_equity', fromJson: _stringToDouble) double? availableEquity,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'rejection_reasons') Map<String, dynamic>? rejectionReasons,@JsonKey(name: 'verified_by') String? verifiedBy,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'resubmission_count') int? resubmissionCount,@JsonKey(name: 'last_submitted_at') DateTime? lastSubmittedAt, List<AssetDocumentModel>? documents,@JsonKey(name: 'insurance_policy') InsurancePolicyModel? insurancePolicy,@JsonKey(name: 'has_active_insurance') bool? hasActiveInsurance,@JsonKey(name: 'is_externally_encumbered') bool isExternallyEncumbered,@JsonKey(name: 'external_lender_name') String? externalLenderName,@JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble) double? externalLienAmount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


$AssetCategoryModelCopyWith<$Res>? get category;$AssetCategoryModelCopyWith<$Res>? get categoryDetails;$InsurancePolicyModelCopyWith<$Res>? get insurancePolicy;

}
/// @nodoc
class _$AssetModelCopyWithImpl<$Res>
    implements $AssetModelCopyWith<$Res> {
  _$AssetModelCopyWithImpl(this._self, this._then);

  final AssetModel _self;
  final $Res Function(AssetModel) _then;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? category = freezed,Object? categoryName = freezed,Object? categoryDetails = freezed,Object? serialNumber = freezed,Object? registrationNumber = freezed,Object? vin = freezed,Object? purchaseDate = freezed,Object? purchasePrice = freezed,Object? currentMarketValue = null,Object? ageYears = freezed,Object? condition = null,Object? conditionScore = freezed,Object? locationAddress = freezed,Object? outstandingLoanAmount = freezed,Object? loanToValue = freezed,Object? availableEquity = freezed,Object? verificationStatus = null,Object? rejectionReasons = freezed,Object? verifiedBy = freezed,Object? verifiedAt = freezed,Object? resubmissionCount = freezed,Object? lastSubmittedAt = freezed,Object? documents = freezed,Object? insurancePolicy = freezed,Object? hasActiveInsurance = freezed,Object? isExternallyEncumbered = null,Object? externalLenderName = freezed,Object? externalLienAmount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AssetCategoryModel?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,categoryDetails: freezed == categoryDetails ? _self.categoryDetails : categoryDetails // ignore: cast_nullable_to_non_nullable
as AssetCategoryModel?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,currentMarketValue: null == currentMarketValue ? _self.currentMarketValue : currentMarketValue // ignore: cast_nullable_to_non_nullable
as double,ageYears: freezed == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as double?,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,conditionScore: freezed == conditionScore ? _self.conditionScore : conditionScore // ignore: cast_nullable_to_non_nullable
as int?,locationAddress: freezed == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String?,outstandingLoanAmount: freezed == outstandingLoanAmount ? _self.outstandingLoanAmount : outstandingLoanAmount // ignore: cast_nullable_to_non_nullable
as double?,loanToValue: freezed == loanToValue ? _self.loanToValue : loanToValue // ignore: cast_nullable_to_non_nullable
as double?,availableEquity: freezed == availableEquity ? _self.availableEquity : availableEquity // ignore: cast_nullable_to_non_nullable
as double?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,rejectionReasons: freezed == rejectionReasons ? _self.rejectionReasons : rejectionReasons // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resubmissionCount: freezed == resubmissionCount ? _self.resubmissionCount : resubmissionCount // ignore: cast_nullable_to_non_nullable
as int?,lastSubmittedAt: freezed == lastSubmittedAt ? _self.lastSubmittedAt : lastSubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<AssetDocumentModel>?,insurancePolicy: freezed == insurancePolicy ? _self.insurancePolicy : insurancePolicy // ignore: cast_nullable_to_non_nullable
as InsurancePolicyModel?,hasActiveInsurance: freezed == hasActiveInsurance ? _self.hasActiveInsurance : hasActiveInsurance // ignore: cast_nullable_to_non_nullable
as bool?,isExternallyEncumbered: null == isExternallyEncumbered ? _self.isExternallyEncumbered : isExternallyEncumbered // ignore: cast_nullable_to_non_nullable
as bool,externalLenderName: freezed == externalLenderName ? _self.externalLenderName : externalLenderName // ignore: cast_nullable_to_non_nullable
as String?,externalLienAmount: freezed == externalLienAmount ? _self.externalLienAmount : externalLienAmount // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $AssetCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCategoryModelCopyWith<$Res>? get categoryDetails {
    if (_self.categoryDetails == null) {
    return null;
  }

  return $AssetCategoryModelCopyWith<$Res>(_self.categoryDetails!, (value) {
    return _then(_self.copyWith(categoryDetails: value));
  });
}/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsurancePolicyModelCopyWith<$Res>? get insurancePolicy {
    if (_self.insurancePolicy == null) {
    return null;
  }

  return $InsurancePolicyModelCopyWith<$Res>(_self.insurancePolicy!, (value) {
    return _then(_self.copyWith(insurancePolicy: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssetModel].
extension AssetModelPatterns on AssetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetModel value)  $default,){
final _that = this;
switch (_that) {
case _AssetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'category')  AssetCategoryModel? category, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_details')  AssetCategoryModel? categoryDetails, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'purchase_date')  DateTime? purchaseDate, @JsonKey(name: 'purchase_price', fromJson: _stringToDouble)  double? purchasePrice, @JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired)  double currentMarketValue, @JsonKey(name: 'age_years', fromJson: _stringToDouble)  double? ageYears,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble)  double? outstandingLoanAmount, @JsonKey(name: 'loan_to_value', fromJson: _stringToDouble)  double? loanToValue, @JsonKey(name: 'available_equity', fromJson: _stringToDouble)  double? availableEquity, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'rejection_reasons')  Map<String, dynamic>? rejectionReasons, @JsonKey(name: 'verified_by')  String? verifiedBy, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'resubmission_count')  int? resubmissionCount, @JsonKey(name: 'last_submitted_at')  DateTime? lastSubmittedAt,  List<AssetDocumentModel>? documents, @JsonKey(name: 'insurance_policy')  InsurancePolicyModel? insurancePolicy, @JsonKey(name: 'has_active_insurance')  bool? hasActiveInsurance, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble)  double? externalLienAmount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.categoryName,_that.categoryDetails,_that.serialNumber,_that.registrationNumber,_that.vin,_that.purchaseDate,_that.purchasePrice,_that.currentMarketValue,_that.ageYears,_that.condition,_that.conditionScore,_that.locationAddress,_that.outstandingLoanAmount,_that.loanToValue,_that.availableEquity,_that.verificationStatus,_that.rejectionReasons,_that.verifiedBy,_that.verifiedAt,_that.resubmissionCount,_that.lastSubmittedAt,_that.documents,_that.insurancePolicy,_that.hasActiveInsurance,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'category')  AssetCategoryModel? category, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_details')  AssetCategoryModel? categoryDetails, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'purchase_date')  DateTime? purchaseDate, @JsonKey(name: 'purchase_price', fromJson: _stringToDouble)  double? purchasePrice, @JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired)  double currentMarketValue, @JsonKey(name: 'age_years', fromJson: _stringToDouble)  double? ageYears,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble)  double? outstandingLoanAmount, @JsonKey(name: 'loan_to_value', fromJson: _stringToDouble)  double? loanToValue, @JsonKey(name: 'available_equity', fromJson: _stringToDouble)  double? availableEquity, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'rejection_reasons')  Map<String, dynamic>? rejectionReasons, @JsonKey(name: 'verified_by')  String? verifiedBy, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'resubmission_count')  int? resubmissionCount, @JsonKey(name: 'last_submitted_at')  DateTime? lastSubmittedAt,  List<AssetDocumentModel>? documents, @JsonKey(name: 'insurance_policy')  InsurancePolicyModel? insurancePolicy, @JsonKey(name: 'has_active_insurance')  bool? hasActiveInsurance, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble)  double? externalLienAmount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AssetModel():
return $default(_that.id,_that.title,_that.description,_that.category,_that.categoryName,_that.categoryDetails,_that.serialNumber,_that.registrationNumber,_that.vin,_that.purchaseDate,_that.purchasePrice,_that.currentMarketValue,_that.ageYears,_that.condition,_that.conditionScore,_that.locationAddress,_that.outstandingLoanAmount,_that.loanToValue,_that.availableEquity,_that.verificationStatus,_that.rejectionReasons,_that.verifiedBy,_that.verifiedAt,_that.resubmissionCount,_that.lastSubmittedAt,_that.documents,_that.insurancePolicy,_that.hasActiveInsurance,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description, @JsonKey(name: 'category')  AssetCategoryModel? category, @JsonKey(name: 'category_name')  String? categoryName, @JsonKey(name: 'category_details')  AssetCategoryModel? categoryDetails, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'purchase_date')  DateTime? purchaseDate, @JsonKey(name: 'purchase_price', fromJson: _stringToDouble)  double? purchasePrice, @JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired)  double currentMarketValue, @JsonKey(name: 'age_years', fromJson: _stringToDouble)  double? ageYears,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble)  double? outstandingLoanAmount, @JsonKey(name: 'loan_to_value', fromJson: _stringToDouble)  double? loanToValue, @JsonKey(name: 'available_equity', fromJson: _stringToDouble)  double? availableEquity, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'rejection_reasons')  Map<String, dynamic>? rejectionReasons, @JsonKey(name: 'verified_by')  String? verifiedBy, @JsonKey(name: 'verified_at')  DateTime? verifiedAt, @JsonKey(name: 'resubmission_count')  int? resubmissionCount, @JsonKey(name: 'last_submitted_at')  DateTime? lastSubmittedAt,  List<AssetDocumentModel>? documents, @JsonKey(name: 'insurance_policy')  InsurancePolicyModel? insurancePolicy, @JsonKey(name: 'has_active_insurance')  bool? hasActiveInsurance, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble)  double? externalLienAmount, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AssetModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.categoryName,_that.categoryDetails,_that.serialNumber,_that.registrationNumber,_that.vin,_that.purchaseDate,_that.purchasePrice,_that.currentMarketValue,_that.ageYears,_that.condition,_that.conditionScore,_that.locationAddress,_that.outstandingLoanAmount,_that.loanToValue,_that.availableEquity,_that.verificationStatus,_that.rejectionReasons,_that.verifiedBy,_that.verifiedAt,_that.resubmissionCount,_that.lastSubmittedAt,_that.documents,_that.insurancePolicy,_that.hasActiveInsurance,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetModel implements AssetModel {
  const _AssetModel({required this.id, required this.title, this.description, @JsonKey(name: 'category') this.category, @JsonKey(name: 'category_name') this.categoryName, @JsonKey(name: 'category_details') this.categoryDetails, @JsonKey(name: 'serial_number') this.serialNumber, @JsonKey(name: 'registration_number') this.registrationNumber, this.vin, @JsonKey(name: 'purchase_date') this.purchaseDate, @JsonKey(name: 'purchase_price', fromJson: _stringToDouble) this.purchasePrice, @JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired) required this.currentMarketValue, @JsonKey(name: 'age_years', fromJson: _stringToDouble) this.ageYears, required this.condition, @JsonKey(name: 'condition_score') this.conditionScore, @JsonKey(name: 'location_address') this.locationAddress, @JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble) this.outstandingLoanAmount, @JsonKey(name: 'loan_to_value', fromJson: _stringToDouble) this.loanToValue, @JsonKey(name: 'available_equity', fromJson: _stringToDouble) this.availableEquity, @JsonKey(name: 'verification_status') required this.verificationStatus, @JsonKey(name: 'rejection_reasons') final  Map<String, dynamic>? rejectionReasons, @JsonKey(name: 'verified_by') this.verifiedBy, @JsonKey(name: 'verified_at') this.verifiedAt, @JsonKey(name: 'resubmission_count') this.resubmissionCount, @JsonKey(name: 'last_submitted_at') this.lastSubmittedAt, final  List<AssetDocumentModel>? documents, @JsonKey(name: 'insurance_policy') this.insurancePolicy, @JsonKey(name: 'has_active_insurance') this.hasActiveInsurance, @JsonKey(name: 'is_externally_encumbered') this.isExternallyEncumbered = false, @JsonKey(name: 'external_lender_name') this.externalLenderName, @JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble) this.externalLienAmount, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _rejectionReasons = rejectionReasons,_documents = documents;
  factory _AssetModel.fromJson(Map<String, dynamic> json) => _$AssetModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
/// Category (Detail serializer)
@override@JsonKey(name: 'category') final  AssetCategoryModel? category;
@override@JsonKey(name: 'category_name') final  String? categoryName;
/// Category (Create serializer)
@override@JsonKey(name: 'category_details') final  AssetCategoryModel? categoryDetails;
/// Sensitive info
@override@JsonKey(name: 'serial_number') final  String? serialNumber;
@override@JsonKey(name: 'registration_number') final  String? registrationNumber;
@override final  String? vin;
/// Financials
@override@JsonKey(name: 'purchase_date') final  DateTime? purchaseDate;
@override@JsonKey(name: 'purchase_price', fromJson: _stringToDouble) final  double? purchasePrice;
@override@JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired) final  double currentMarketValue;
// @JsonKey(
//   name: 'collateral_value',
//   fromJson: _stringToDoubleRequired,
// )
// required double collateralValue,
/// Condition
@override@JsonKey(name: 'age_years', fromJson: _stringToDouble) final  double? ageYears;
@override final  String condition;
@override@JsonKey(name: 'condition_score') final  int? conditionScore;
/// Location
@override@JsonKey(name: 'location_address') final  String? locationAddress;
/// Loan tracking
@override@JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble) final  double? outstandingLoanAmount;
@override@JsonKey(name: 'loan_to_value', fromJson: _stringToDouble) final  double? loanToValue;
@override@JsonKey(name: 'available_equity', fromJson: _stringToDouble) final  double? availableEquity;
/// Verification
@override@JsonKey(name: 'verification_status') final  String verificationStatus;
 final  Map<String, dynamic>? _rejectionReasons;
@override@JsonKey(name: 'rejection_reasons') Map<String, dynamic>? get rejectionReasons {
  final value = _rejectionReasons;
  if (value == null) return null;
  if (_rejectionReasons is EqualUnmodifiableMapView) return _rejectionReasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'verified_by') final  String? verifiedBy;
@override@JsonKey(name: 'verified_at') final  DateTime? verifiedAt;
/// Audit
@override@JsonKey(name: 'resubmission_count') final  int? resubmissionCount;
@override@JsonKey(name: 'last_submitted_at') final  DateTime? lastSubmittedAt;
/// Documents
 final  List<AssetDocumentModel>? _documents;
/// Documents
@override List<AssetDocumentModel>? get documents {
  final value = _documents;
  if (value == null) return null;
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Insurance
@override@JsonKey(name: 'insurance_policy') final  InsurancePolicyModel? insurancePolicy;
@override@JsonKey(name: 'has_active_insurance') final  bool? hasActiveInsurance;
@override@JsonKey(name: 'is_externally_encumbered') final  bool isExternallyEncumbered;
@override@JsonKey(name: 'external_lender_name') final  String? externalLenderName;
@override@JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble) final  double? externalLienAmount;
/// Timestamps
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetModelCopyWith<_AssetModel> get copyWith => __$AssetModelCopyWithImpl<_AssetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.categoryDetails, categoryDetails) || other.categoryDetails == categoryDetails)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.currentMarketValue, currentMarketValue) || other.currentMarketValue == currentMarketValue)&&(identical(other.ageYears, ageYears) || other.ageYears == ageYears)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.conditionScore, conditionScore) || other.conditionScore == conditionScore)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.outstandingLoanAmount, outstandingLoanAmount) || other.outstandingLoanAmount == outstandingLoanAmount)&&(identical(other.loanToValue, loanToValue) || other.loanToValue == loanToValue)&&(identical(other.availableEquity, availableEquity) || other.availableEquity == availableEquity)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&const DeepCollectionEquality().equals(other._rejectionReasons, _rejectionReasons)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.resubmissionCount, resubmissionCount) || other.resubmissionCount == resubmissionCount)&&(identical(other.lastSubmittedAt, lastSubmittedAt) || other.lastSubmittedAt == lastSubmittedAt)&&const DeepCollectionEquality().equals(other._documents, _documents)&&(identical(other.insurancePolicy, insurancePolicy) || other.insurancePolicy == insurancePolicy)&&(identical(other.hasActiveInsurance, hasActiveInsurance) || other.hasActiveInsurance == hasActiveInsurance)&&(identical(other.isExternallyEncumbered, isExternallyEncumbered) || other.isExternallyEncumbered == isExternallyEncumbered)&&(identical(other.externalLenderName, externalLenderName) || other.externalLenderName == externalLenderName)&&(identical(other.externalLienAmount, externalLienAmount) || other.externalLienAmount == externalLienAmount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,category,categoryName,categoryDetails,serialNumber,registrationNumber,vin,purchaseDate,purchasePrice,currentMarketValue,ageYears,condition,conditionScore,locationAddress,outstandingLoanAmount,loanToValue,availableEquity,verificationStatus,const DeepCollectionEquality().hash(_rejectionReasons),verifiedBy,verifiedAt,resubmissionCount,lastSubmittedAt,const DeepCollectionEquality().hash(_documents),insurancePolicy,hasActiveInsurance,isExternallyEncumbered,externalLenderName,externalLienAmount,createdAt,updatedAt]);

@override
String toString() {
  return 'AssetModel(id: $id, title: $title, description: $description, category: $category, categoryName: $categoryName, categoryDetails: $categoryDetails, serialNumber: $serialNumber, registrationNumber: $registrationNumber, vin: $vin, purchaseDate: $purchaseDate, purchasePrice: $purchasePrice, currentMarketValue: $currentMarketValue, ageYears: $ageYears, condition: $condition, conditionScore: $conditionScore, locationAddress: $locationAddress, outstandingLoanAmount: $outstandingLoanAmount, loanToValue: $loanToValue, availableEquity: $availableEquity, verificationStatus: $verificationStatus, rejectionReasons: $rejectionReasons, verifiedBy: $verifiedBy, verifiedAt: $verifiedAt, resubmissionCount: $resubmissionCount, lastSubmittedAt: $lastSubmittedAt, documents: $documents, insurancePolicy: $insurancePolicy, hasActiveInsurance: $hasActiveInsurance, isExternallyEncumbered: $isExternallyEncumbered, externalLenderName: $externalLenderName, externalLienAmount: $externalLienAmount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AssetModelCopyWith<$Res> implements $AssetModelCopyWith<$Res> {
  factory _$AssetModelCopyWith(_AssetModel value, $Res Function(_AssetModel) _then) = __$AssetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'category') AssetCategoryModel? category,@JsonKey(name: 'category_name') String? categoryName,@JsonKey(name: 'category_details') AssetCategoryModel? categoryDetails,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'registration_number') String? registrationNumber, String? vin,@JsonKey(name: 'purchase_date') DateTime? purchaseDate,@JsonKey(name: 'purchase_price', fromJson: _stringToDouble) double? purchasePrice,@JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired) double currentMarketValue,@JsonKey(name: 'age_years', fromJson: _stringToDouble) double? ageYears, String condition,@JsonKey(name: 'condition_score') int? conditionScore,@JsonKey(name: 'location_address') String? locationAddress,@JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble) double? outstandingLoanAmount,@JsonKey(name: 'loan_to_value', fromJson: _stringToDouble) double? loanToValue,@JsonKey(name: 'available_equity', fromJson: _stringToDouble) double? availableEquity,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'rejection_reasons') Map<String, dynamic>? rejectionReasons,@JsonKey(name: 'verified_by') String? verifiedBy,@JsonKey(name: 'verified_at') DateTime? verifiedAt,@JsonKey(name: 'resubmission_count') int? resubmissionCount,@JsonKey(name: 'last_submitted_at') DateTime? lastSubmittedAt, List<AssetDocumentModel>? documents,@JsonKey(name: 'insurance_policy') InsurancePolicyModel? insurancePolicy,@JsonKey(name: 'has_active_insurance') bool? hasActiveInsurance,@JsonKey(name: 'is_externally_encumbered') bool isExternallyEncumbered,@JsonKey(name: 'external_lender_name') String? externalLenderName,@JsonKey(name: 'external_lien_amount', fromJson: _stringToDouble) double? externalLienAmount,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});


@override $AssetCategoryModelCopyWith<$Res>? get category;@override $AssetCategoryModelCopyWith<$Res>? get categoryDetails;@override $InsurancePolicyModelCopyWith<$Res>? get insurancePolicy;

}
/// @nodoc
class __$AssetModelCopyWithImpl<$Res>
    implements _$AssetModelCopyWith<$Res> {
  __$AssetModelCopyWithImpl(this._self, this._then);

  final _AssetModel _self;
  final $Res Function(_AssetModel) _then;

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? category = freezed,Object? categoryName = freezed,Object? categoryDetails = freezed,Object? serialNumber = freezed,Object? registrationNumber = freezed,Object? vin = freezed,Object? purchaseDate = freezed,Object? purchasePrice = freezed,Object? currentMarketValue = null,Object? ageYears = freezed,Object? condition = null,Object? conditionScore = freezed,Object? locationAddress = freezed,Object? outstandingLoanAmount = freezed,Object? loanToValue = freezed,Object? availableEquity = freezed,Object? verificationStatus = null,Object? rejectionReasons = freezed,Object? verifiedBy = freezed,Object? verifiedAt = freezed,Object? resubmissionCount = freezed,Object? lastSubmittedAt = freezed,Object? documents = freezed,Object? insurancePolicy = freezed,Object? hasActiveInsurance = freezed,Object? isExternallyEncumbered = null,Object? externalLenderName = freezed,Object? externalLienAmount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AssetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AssetCategoryModel?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,categoryDetails: freezed == categoryDetails ? _self.categoryDetails : categoryDetails // ignore: cast_nullable_to_non_nullable
as AssetCategoryModel?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,purchaseDate: freezed == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime?,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,currentMarketValue: null == currentMarketValue ? _self.currentMarketValue : currentMarketValue // ignore: cast_nullable_to_non_nullable
as double,ageYears: freezed == ageYears ? _self.ageYears : ageYears // ignore: cast_nullable_to_non_nullable
as double?,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,conditionScore: freezed == conditionScore ? _self.conditionScore : conditionScore // ignore: cast_nullable_to_non_nullable
as int?,locationAddress: freezed == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String?,outstandingLoanAmount: freezed == outstandingLoanAmount ? _self.outstandingLoanAmount : outstandingLoanAmount // ignore: cast_nullable_to_non_nullable
as double?,loanToValue: freezed == loanToValue ? _self.loanToValue : loanToValue // ignore: cast_nullable_to_non_nullable
as double?,availableEquity: freezed == availableEquity ? _self.availableEquity : availableEquity // ignore: cast_nullable_to_non_nullable
as double?,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,rejectionReasons: freezed == rejectionReasons ? _self._rejectionReasons : rejectionReasons // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resubmissionCount: freezed == resubmissionCount ? _self.resubmissionCount : resubmissionCount // ignore: cast_nullable_to_non_nullable
as int?,lastSubmittedAt: freezed == lastSubmittedAt ? _self.lastSubmittedAt : lastSubmittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: freezed == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<AssetDocumentModel>?,insurancePolicy: freezed == insurancePolicy ? _self.insurancePolicy : insurancePolicy // ignore: cast_nullable_to_non_nullable
as InsurancePolicyModel?,hasActiveInsurance: freezed == hasActiveInsurance ? _self.hasActiveInsurance : hasActiveInsurance // ignore: cast_nullable_to_non_nullable
as bool?,isExternallyEncumbered: null == isExternallyEncumbered ? _self.isExternallyEncumbered : isExternallyEncumbered // ignore: cast_nullable_to_non_nullable
as bool,externalLenderName: freezed == externalLenderName ? _self.externalLenderName : externalLenderName // ignore: cast_nullable_to_non_nullable
as String?,externalLienAmount: freezed == externalLienAmount ? _self.externalLienAmount : externalLienAmount // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $AssetCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetCategoryModelCopyWith<$Res>? get categoryDetails {
    if (_self.categoryDetails == null) {
    return null;
  }

  return $AssetCategoryModelCopyWith<$Res>(_self.categoryDetails!, (value) {
    return _then(_self.copyWith(categoryDetails: value));
  });
}/// Create a copy of AssetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InsurancePolicyModelCopyWith<$Res>? get insurancePolicy {
    if (_self.insurancePolicy == null) {
    return null;
  }

  return $InsurancePolicyModelCopyWith<$Res>(_self.insurancePolicy!, (value) {
    return _then(_self.copyWith(insurancePolicy: value));
  });
}
}

// dart format on
