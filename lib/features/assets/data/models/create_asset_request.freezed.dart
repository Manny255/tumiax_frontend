// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_asset_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateAssetRequest {

 int get category; String get title; String? get description;@JsonKey(name: 'purchase_price') double get purchasePrice;@DateOnlyConverter()@JsonKey(name: 'purchase_date') DateTime get purchaseDate;@JsonKey(name: 'current_market_value') double get currentMarketValue; String get condition;@JsonKey(name: 'condition_score') int? get conditionScore;@JsonKey(name: 'serial_number') String? get serialNumber;@JsonKey(name: 'registration_number') String? get registrationNumber; String? get vin;@JsonKey(name: 'location_address') String? get locationAddress;@JsonKey(name: 'gps_address') String? get gpsAddress; double get latitude; double get longitude;// Files (excluded from JSON)
@JsonKey(includeFromJson: false, includeToJson: false) List<File>? get files;@JsonKey(name: 'is_externally_encumbered') bool get isExternallyEncumbered;@JsonKey(name: 'external_lender_name') String? get externalLenderName;@JsonKey(name: 'external_lien_amount') double? get externalLienAmount;
/// Create a copy of CreateAssetRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssetRequestCopyWith<CreateAssetRequest> get copyWith => _$CreateAssetRequestCopyWithImpl<CreateAssetRequest>(this as CreateAssetRequest, _$identity);

  /// Serializes this CreateAssetRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssetRequest&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.currentMarketValue, currentMarketValue) || other.currentMarketValue == currentMarketValue)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.conditionScore, conditionScore) || other.conditionScore == conditionScore)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.gpsAddress, gpsAddress) || other.gpsAddress == gpsAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.isExternallyEncumbered, isExternallyEncumbered) || other.isExternallyEncumbered == isExternallyEncumbered)&&(identical(other.externalLenderName, externalLenderName) || other.externalLenderName == externalLenderName)&&(identical(other.externalLienAmount, externalLienAmount) || other.externalLienAmount == externalLienAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,category,title,description,purchasePrice,purchaseDate,currentMarketValue,condition,conditionScore,serialNumber,registrationNumber,vin,locationAddress,gpsAddress,latitude,longitude,const DeepCollectionEquality().hash(files),isExternallyEncumbered,externalLenderName,externalLienAmount]);

@override
String toString() {
  return 'CreateAssetRequest(category: $category, title: $title, description: $description, purchasePrice: $purchasePrice, purchaseDate: $purchaseDate, currentMarketValue: $currentMarketValue, condition: $condition, conditionScore: $conditionScore, serialNumber: $serialNumber, registrationNumber: $registrationNumber, vin: $vin, locationAddress: $locationAddress, gpsAddress: $gpsAddress, latitude: $latitude, longitude: $longitude, files: $files, isExternallyEncumbered: $isExternallyEncumbered, externalLenderName: $externalLenderName, externalLienAmount: $externalLienAmount)';
}


}

/// @nodoc
abstract mixin class $CreateAssetRequestCopyWith<$Res>  {
  factory $CreateAssetRequestCopyWith(CreateAssetRequest value, $Res Function(CreateAssetRequest) _then) = _$CreateAssetRequestCopyWithImpl;
@useResult
$Res call({
 int category, String title, String? description,@JsonKey(name: 'purchase_price') double purchasePrice,@DateOnlyConverter()@JsonKey(name: 'purchase_date') DateTime purchaseDate,@JsonKey(name: 'current_market_value') double currentMarketValue, String condition,@JsonKey(name: 'condition_score') int? conditionScore,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'registration_number') String? registrationNumber, String? vin,@JsonKey(name: 'location_address') String? locationAddress,@JsonKey(name: 'gps_address') String? gpsAddress, double latitude, double longitude,@JsonKey(includeFromJson: false, includeToJson: false) List<File>? files,@JsonKey(name: 'is_externally_encumbered') bool isExternallyEncumbered,@JsonKey(name: 'external_lender_name') String? externalLenderName,@JsonKey(name: 'external_lien_amount') double? externalLienAmount
});




}
/// @nodoc
class _$CreateAssetRequestCopyWithImpl<$Res>
    implements $CreateAssetRequestCopyWith<$Res> {
  _$CreateAssetRequestCopyWithImpl(this._self, this._then);

  final CreateAssetRequest _self;
  final $Res Function(CreateAssetRequest) _then;

/// Create a copy of CreateAssetRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? title = null,Object? description = freezed,Object? purchasePrice = null,Object? purchaseDate = null,Object? currentMarketValue = null,Object? condition = null,Object? conditionScore = freezed,Object? serialNumber = freezed,Object? registrationNumber = freezed,Object? vin = freezed,Object? locationAddress = freezed,Object? gpsAddress = freezed,Object? latitude = null,Object? longitude = null,Object? files = freezed,Object? isExternallyEncumbered = null,Object? externalLenderName = freezed,Object? externalLienAmount = freezed,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,currentMarketValue: null == currentMarketValue ? _self.currentMarketValue : currentMarketValue // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,conditionScore: freezed == conditionScore ? _self.conditionScore : conditionScore // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,locationAddress: freezed == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String?,gpsAddress: freezed == gpsAddress ? _self.gpsAddress : gpsAddress // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<File>?,isExternallyEncumbered: null == isExternallyEncumbered ? _self.isExternallyEncumbered : isExternallyEncumbered // ignore: cast_nullable_to_non_nullable
as bool,externalLenderName: freezed == externalLenderName ? _self.externalLenderName : externalLenderName // ignore: cast_nullable_to_non_nullable
as String?,externalLienAmount: freezed == externalLienAmount ? _self.externalLienAmount : externalLienAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateAssetRequest].
extension CreateAssetRequestPatterns on CreateAssetRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAssetRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAssetRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAssetRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateAssetRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAssetRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAssetRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int category,  String title,  String? description, @JsonKey(name: 'purchase_price')  double purchasePrice, @DateOnlyConverter()@JsonKey(name: 'purchase_date')  DateTime purchaseDate, @JsonKey(name: 'current_market_value')  double currentMarketValue,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'gps_address')  String? gpsAddress,  double latitude,  double longitude, @JsonKey(includeFromJson: false, includeToJson: false)  List<File>? files, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount')  double? externalLienAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssetRequest() when $default != null:
return $default(_that.category,_that.title,_that.description,_that.purchasePrice,_that.purchaseDate,_that.currentMarketValue,_that.condition,_that.conditionScore,_that.serialNumber,_that.registrationNumber,_that.vin,_that.locationAddress,_that.gpsAddress,_that.latitude,_that.longitude,_that.files,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int category,  String title,  String? description, @JsonKey(name: 'purchase_price')  double purchasePrice, @DateOnlyConverter()@JsonKey(name: 'purchase_date')  DateTime purchaseDate, @JsonKey(name: 'current_market_value')  double currentMarketValue,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'gps_address')  String? gpsAddress,  double latitude,  double longitude, @JsonKey(includeFromJson: false, includeToJson: false)  List<File>? files, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount')  double? externalLienAmount)  $default,) {final _that = this;
switch (_that) {
case _CreateAssetRequest():
return $default(_that.category,_that.title,_that.description,_that.purchasePrice,_that.purchaseDate,_that.currentMarketValue,_that.condition,_that.conditionScore,_that.serialNumber,_that.registrationNumber,_that.vin,_that.locationAddress,_that.gpsAddress,_that.latitude,_that.longitude,_that.files,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int category,  String title,  String? description, @JsonKey(name: 'purchase_price')  double purchasePrice, @DateOnlyConverter()@JsonKey(name: 'purchase_date')  DateTime purchaseDate, @JsonKey(name: 'current_market_value')  double currentMarketValue,  String condition, @JsonKey(name: 'condition_score')  int? conditionScore, @JsonKey(name: 'serial_number')  String? serialNumber, @JsonKey(name: 'registration_number')  String? registrationNumber,  String? vin, @JsonKey(name: 'location_address')  String? locationAddress, @JsonKey(name: 'gps_address')  String? gpsAddress,  double latitude,  double longitude, @JsonKey(includeFromJson: false, includeToJson: false)  List<File>? files, @JsonKey(name: 'is_externally_encumbered')  bool isExternallyEncumbered, @JsonKey(name: 'external_lender_name')  String? externalLenderName, @JsonKey(name: 'external_lien_amount')  double? externalLienAmount)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssetRequest() when $default != null:
return $default(_that.category,_that.title,_that.description,_that.purchasePrice,_that.purchaseDate,_that.currentMarketValue,_that.condition,_that.conditionScore,_that.serialNumber,_that.registrationNumber,_that.vin,_that.locationAddress,_that.gpsAddress,_that.latitude,_that.longitude,_that.files,_that.isExternallyEncumbered,_that.externalLenderName,_that.externalLienAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAssetRequest implements CreateAssetRequest {
  const _CreateAssetRequest({required this.category, required this.title, this.description, @JsonKey(name: 'purchase_price') required this.purchasePrice, @DateOnlyConverter()@JsonKey(name: 'purchase_date') required this.purchaseDate, @JsonKey(name: 'current_market_value') required this.currentMarketValue, required this.condition, @JsonKey(name: 'condition_score') this.conditionScore, @JsonKey(name: 'serial_number') this.serialNumber, @JsonKey(name: 'registration_number') this.registrationNumber, this.vin, @JsonKey(name: 'location_address') this.locationAddress, @JsonKey(name: 'gps_address') this.gpsAddress, required this.latitude, required this.longitude, @JsonKey(includeFromJson: false, includeToJson: false) final  List<File>? files, @JsonKey(name: 'is_externally_encumbered') this.isExternallyEncumbered = false, @JsonKey(name: 'external_lender_name') this.externalLenderName, @JsonKey(name: 'external_lien_amount') this.externalLienAmount}): _files = files;
  factory _CreateAssetRequest.fromJson(Map<String, dynamic> json) => _$CreateAssetRequestFromJson(json);

@override final  int category;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'purchase_price') final  double purchasePrice;
@override@DateOnlyConverter()@JsonKey(name: 'purchase_date') final  DateTime purchaseDate;
@override@JsonKey(name: 'current_market_value') final  double currentMarketValue;
@override final  String condition;
@override@JsonKey(name: 'condition_score') final  int? conditionScore;
@override@JsonKey(name: 'serial_number') final  String? serialNumber;
@override@JsonKey(name: 'registration_number') final  String? registrationNumber;
@override final  String? vin;
@override@JsonKey(name: 'location_address') final  String? locationAddress;
@override@JsonKey(name: 'gps_address') final  String? gpsAddress;
@override final  double latitude;
@override final  double longitude;
// Files (excluded from JSON)
 final  List<File>? _files;
// Files (excluded from JSON)
@override@JsonKey(includeFromJson: false, includeToJson: false) List<File>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'is_externally_encumbered') final  bool isExternallyEncumbered;
@override@JsonKey(name: 'external_lender_name') final  String? externalLenderName;
@override@JsonKey(name: 'external_lien_amount') final  double? externalLienAmount;

/// Create a copy of CreateAssetRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAssetRequestCopyWith<_CreateAssetRequest> get copyWith => __$CreateAssetRequestCopyWithImpl<_CreateAssetRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAssetRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssetRequest&&(identical(other.category, category) || other.category == category)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.currentMarketValue, currentMarketValue) || other.currentMarketValue == currentMarketValue)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.conditionScore, conditionScore) || other.conditionScore == conditionScore)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.locationAddress, locationAddress) || other.locationAddress == locationAddress)&&(identical(other.gpsAddress, gpsAddress) || other.gpsAddress == gpsAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.isExternallyEncumbered, isExternallyEncumbered) || other.isExternallyEncumbered == isExternallyEncumbered)&&(identical(other.externalLenderName, externalLenderName) || other.externalLenderName == externalLenderName)&&(identical(other.externalLienAmount, externalLienAmount) || other.externalLienAmount == externalLienAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,category,title,description,purchasePrice,purchaseDate,currentMarketValue,condition,conditionScore,serialNumber,registrationNumber,vin,locationAddress,gpsAddress,latitude,longitude,const DeepCollectionEquality().hash(_files),isExternallyEncumbered,externalLenderName,externalLienAmount]);

@override
String toString() {
  return 'CreateAssetRequest(category: $category, title: $title, description: $description, purchasePrice: $purchasePrice, purchaseDate: $purchaseDate, currentMarketValue: $currentMarketValue, condition: $condition, conditionScore: $conditionScore, serialNumber: $serialNumber, registrationNumber: $registrationNumber, vin: $vin, locationAddress: $locationAddress, gpsAddress: $gpsAddress, latitude: $latitude, longitude: $longitude, files: $files, isExternallyEncumbered: $isExternallyEncumbered, externalLenderName: $externalLenderName, externalLienAmount: $externalLienAmount)';
}


}

/// @nodoc
abstract mixin class _$CreateAssetRequestCopyWith<$Res> implements $CreateAssetRequestCopyWith<$Res> {
  factory _$CreateAssetRequestCopyWith(_CreateAssetRequest value, $Res Function(_CreateAssetRequest) _then) = __$CreateAssetRequestCopyWithImpl;
@override @useResult
$Res call({
 int category, String title, String? description,@JsonKey(name: 'purchase_price') double purchasePrice,@DateOnlyConverter()@JsonKey(name: 'purchase_date') DateTime purchaseDate,@JsonKey(name: 'current_market_value') double currentMarketValue, String condition,@JsonKey(name: 'condition_score') int? conditionScore,@JsonKey(name: 'serial_number') String? serialNumber,@JsonKey(name: 'registration_number') String? registrationNumber, String? vin,@JsonKey(name: 'location_address') String? locationAddress,@JsonKey(name: 'gps_address') String? gpsAddress, double latitude, double longitude,@JsonKey(includeFromJson: false, includeToJson: false) List<File>? files,@JsonKey(name: 'is_externally_encumbered') bool isExternallyEncumbered,@JsonKey(name: 'external_lender_name') String? externalLenderName,@JsonKey(name: 'external_lien_amount') double? externalLienAmount
});




}
/// @nodoc
class __$CreateAssetRequestCopyWithImpl<$Res>
    implements _$CreateAssetRequestCopyWith<$Res> {
  __$CreateAssetRequestCopyWithImpl(this._self, this._then);

  final _CreateAssetRequest _self;
  final $Res Function(_CreateAssetRequest) _then;

/// Create a copy of CreateAssetRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? title = null,Object? description = freezed,Object? purchasePrice = null,Object? purchaseDate = null,Object? currentMarketValue = null,Object? condition = null,Object? conditionScore = freezed,Object? serialNumber = freezed,Object? registrationNumber = freezed,Object? vin = freezed,Object? locationAddress = freezed,Object? gpsAddress = freezed,Object? latitude = null,Object? longitude = null,Object? files = freezed,Object? isExternallyEncumbered = null,Object? externalLenderName = freezed,Object? externalLienAmount = freezed,}) {
  return _then(_CreateAssetRequest(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,purchasePrice: null == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,currentMarketValue: null == currentMarketValue ? _self.currentMarketValue : currentMarketValue // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,conditionScore: freezed == conditionScore ? _self.conditionScore : conditionScore // ignore: cast_nullable_to_non_nullable
as int?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,locationAddress: freezed == locationAddress ? _self.locationAddress : locationAddress // ignore: cast_nullable_to_non_nullable
as String?,gpsAddress: freezed == gpsAddress ? _self.gpsAddress : gpsAddress // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<File>?,isExternallyEncumbered: null == isExternallyEncumbered ? _self.isExternallyEncumbered : isExternallyEncumbered // ignore: cast_nullable_to_non_nullable
as bool,externalLenderName: freezed == externalLenderName ? _self.externalLenderName : externalLenderName // ignore: cast_nullable_to_non_nullable
as String?,externalLienAmount: freezed == externalLienAmount ? _self.externalLienAmount : externalLienAmount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
