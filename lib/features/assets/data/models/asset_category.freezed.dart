// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssetCategoryModel {

 int get id; String get name; String get code;@JsonKey(name: 'base_ltv', fromJson: _doubleFromJson) double get baseLtv;@JsonKey(name: 'max_ltv', fromJson: _doubleFromJson) double get maxLtv;@JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson) double get annualDepreciationRate;@JsonKey(name: 'max_age_years') int get maxAgeYears;@JsonKey(name: 'requires_insurance') bool get requiresInsurance;@JsonKey(name: 'requires_valuation') bool get requiresValuation;@JsonKey(name: 'requires_inspection') bool get requiresInspection; String? get description; String? get icon;
/// Create a copy of AssetCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssetCategoryModelCopyWith<AssetCategoryModel> get copyWith => _$AssetCategoryModelCopyWithImpl<AssetCategoryModel>(this as AssetCategoryModel, _$identity);

  /// Serializes this AssetCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.baseLtv, baseLtv) || other.baseLtv == baseLtv)&&(identical(other.maxLtv, maxLtv) || other.maxLtv == maxLtv)&&(identical(other.annualDepreciationRate, annualDepreciationRate) || other.annualDepreciationRate == annualDepreciationRate)&&(identical(other.maxAgeYears, maxAgeYears) || other.maxAgeYears == maxAgeYears)&&(identical(other.requiresInsurance, requiresInsurance) || other.requiresInsurance == requiresInsurance)&&(identical(other.requiresValuation, requiresValuation) || other.requiresValuation == requiresValuation)&&(identical(other.requiresInspection, requiresInspection) || other.requiresInspection == requiresInspection)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,baseLtv,maxLtv,annualDepreciationRate,maxAgeYears,requiresInsurance,requiresValuation,requiresInspection,description,icon);

@override
String toString() {
  return 'AssetCategoryModel(id: $id, name: $name, code: $code, baseLtv: $baseLtv, maxLtv: $maxLtv, annualDepreciationRate: $annualDepreciationRate, maxAgeYears: $maxAgeYears, requiresInsurance: $requiresInsurance, requiresValuation: $requiresValuation, requiresInspection: $requiresInspection, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $AssetCategoryModelCopyWith<$Res>  {
  factory $AssetCategoryModelCopyWith(AssetCategoryModel value, $Res Function(AssetCategoryModel) _then) = _$AssetCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String code,@JsonKey(name: 'base_ltv', fromJson: _doubleFromJson) double baseLtv,@JsonKey(name: 'max_ltv', fromJson: _doubleFromJson) double maxLtv,@JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson) double annualDepreciationRate,@JsonKey(name: 'max_age_years') int maxAgeYears,@JsonKey(name: 'requires_insurance') bool requiresInsurance,@JsonKey(name: 'requires_valuation') bool requiresValuation,@JsonKey(name: 'requires_inspection') bool requiresInspection, String? description, String? icon
});




}
/// @nodoc
class _$AssetCategoryModelCopyWithImpl<$Res>
    implements $AssetCategoryModelCopyWith<$Res> {
  _$AssetCategoryModelCopyWithImpl(this._self, this._then);

  final AssetCategoryModel _self;
  final $Res Function(AssetCategoryModel) _then;

/// Create a copy of AssetCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? baseLtv = null,Object? maxLtv = null,Object? annualDepreciationRate = null,Object? maxAgeYears = null,Object? requiresInsurance = null,Object? requiresValuation = null,Object? requiresInspection = null,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,baseLtv: null == baseLtv ? _self.baseLtv : baseLtv // ignore: cast_nullable_to_non_nullable
as double,maxLtv: null == maxLtv ? _self.maxLtv : maxLtv // ignore: cast_nullable_to_non_nullable
as double,annualDepreciationRate: null == annualDepreciationRate ? _self.annualDepreciationRate : annualDepreciationRate // ignore: cast_nullable_to_non_nullable
as double,maxAgeYears: null == maxAgeYears ? _self.maxAgeYears : maxAgeYears // ignore: cast_nullable_to_non_nullable
as int,requiresInsurance: null == requiresInsurance ? _self.requiresInsurance : requiresInsurance // ignore: cast_nullable_to_non_nullable
as bool,requiresValuation: null == requiresValuation ? _self.requiresValuation : requiresValuation // ignore: cast_nullable_to_non_nullable
as bool,requiresInspection: null == requiresInspection ? _self.requiresInspection : requiresInspection // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssetCategoryModel].
extension AssetCategoryModelPatterns on AssetCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssetCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssetCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssetCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _AssetCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssetCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssetCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String code, @JsonKey(name: 'base_ltv', fromJson: _doubleFromJson)  double baseLtv, @JsonKey(name: 'max_ltv', fromJson: _doubleFromJson)  double maxLtv, @JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson)  double annualDepreciationRate, @JsonKey(name: 'max_age_years')  int maxAgeYears, @JsonKey(name: 'requires_insurance')  bool requiresInsurance, @JsonKey(name: 'requires_valuation')  bool requiresValuation, @JsonKey(name: 'requires_inspection')  bool requiresInspection,  String? description,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssetCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.baseLtv,_that.maxLtv,_that.annualDepreciationRate,_that.maxAgeYears,_that.requiresInsurance,_that.requiresValuation,_that.requiresInspection,_that.description,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String code, @JsonKey(name: 'base_ltv', fromJson: _doubleFromJson)  double baseLtv, @JsonKey(name: 'max_ltv', fromJson: _doubleFromJson)  double maxLtv, @JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson)  double annualDepreciationRate, @JsonKey(name: 'max_age_years')  int maxAgeYears, @JsonKey(name: 'requires_insurance')  bool requiresInsurance, @JsonKey(name: 'requires_valuation')  bool requiresValuation, @JsonKey(name: 'requires_inspection')  bool requiresInspection,  String? description,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _AssetCategoryModel():
return $default(_that.id,_that.name,_that.code,_that.baseLtv,_that.maxLtv,_that.annualDepreciationRate,_that.maxAgeYears,_that.requiresInsurance,_that.requiresValuation,_that.requiresInspection,_that.description,_that.icon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String code, @JsonKey(name: 'base_ltv', fromJson: _doubleFromJson)  double baseLtv, @JsonKey(name: 'max_ltv', fromJson: _doubleFromJson)  double maxLtv, @JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson)  double annualDepreciationRate, @JsonKey(name: 'max_age_years')  int maxAgeYears, @JsonKey(name: 'requires_insurance')  bool requiresInsurance, @JsonKey(name: 'requires_valuation')  bool requiresValuation, @JsonKey(name: 'requires_inspection')  bool requiresInspection,  String? description,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _AssetCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.baseLtv,_that.maxLtv,_that.annualDepreciationRate,_that.maxAgeYears,_that.requiresInsurance,_that.requiresValuation,_that.requiresInspection,_that.description,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssetCategoryModel implements AssetCategoryModel {
  const _AssetCategoryModel({required this.id, required this.name, required this.code, @JsonKey(name: 'base_ltv', fromJson: _doubleFromJson) required this.baseLtv, @JsonKey(name: 'max_ltv', fromJson: _doubleFromJson) required this.maxLtv, @JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson) required this.annualDepreciationRate, @JsonKey(name: 'max_age_years') required this.maxAgeYears, @JsonKey(name: 'requires_insurance') required this.requiresInsurance, @JsonKey(name: 'requires_valuation') required this.requiresValuation, @JsonKey(name: 'requires_inspection') required this.requiresInspection, this.description, this.icon});
  factory _AssetCategoryModel.fromJson(Map<String, dynamic> json) => _$AssetCategoryModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String code;
@override@JsonKey(name: 'base_ltv', fromJson: _doubleFromJson) final  double baseLtv;
@override@JsonKey(name: 'max_ltv', fromJson: _doubleFromJson) final  double maxLtv;
@override@JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson) final  double annualDepreciationRate;
@override@JsonKey(name: 'max_age_years') final  int maxAgeYears;
@override@JsonKey(name: 'requires_insurance') final  bool requiresInsurance;
@override@JsonKey(name: 'requires_valuation') final  bool requiresValuation;
@override@JsonKey(name: 'requires_inspection') final  bool requiresInspection;
@override final  String? description;
@override final  String? icon;

/// Create a copy of AssetCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssetCategoryModelCopyWith<_AssetCategoryModel> get copyWith => __$AssetCategoryModelCopyWithImpl<_AssetCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssetCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssetCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.baseLtv, baseLtv) || other.baseLtv == baseLtv)&&(identical(other.maxLtv, maxLtv) || other.maxLtv == maxLtv)&&(identical(other.annualDepreciationRate, annualDepreciationRate) || other.annualDepreciationRate == annualDepreciationRate)&&(identical(other.maxAgeYears, maxAgeYears) || other.maxAgeYears == maxAgeYears)&&(identical(other.requiresInsurance, requiresInsurance) || other.requiresInsurance == requiresInsurance)&&(identical(other.requiresValuation, requiresValuation) || other.requiresValuation == requiresValuation)&&(identical(other.requiresInspection, requiresInspection) || other.requiresInspection == requiresInspection)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,baseLtv,maxLtv,annualDepreciationRate,maxAgeYears,requiresInsurance,requiresValuation,requiresInspection,description,icon);

@override
String toString() {
  return 'AssetCategoryModel(id: $id, name: $name, code: $code, baseLtv: $baseLtv, maxLtv: $maxLtv, annualDepreciationRate: $annualDepreciationRate, maxAgeYears: $maxAgeYears, requiresInsurance: $requiresInsurance, requiresValuation: $requiresValuation, requiresInspection: $requiresInspection, description: $description, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$AssetCategoryModelCopyWith<$Res> implements $AssetCategoryModelCopyWith<$Res> {
  factory _$AssetCategoryModelCopyWith(_AssetCategoryModel value, $Res Function(_AssetCategoryModel) _then) = __$AssetCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String code,@JsonKey(name: 'base_ltv', fromJson: _doubleFromJson) double baseLtv,@JsonKey(name: 'max_ltv', fromJson: _doubleFromJson) double maxLtv,@JsonKey(name: 'annual_depreciation_rate', fromJson: _doubleFromJson) double annualDepreciationRate,@JsonKey(name: 'max_age_years') int maxAgeYears,@JsonKey(name: 'requires_insurance') bool requiresInsurance,@JsonKey(name: 'requires_valuation') bool requiresValuation,@JsonKey(name: 'requires_inspection') bool requiresInspection, String? description, String? icon
});




}
/// @nodoc
class __$AssetCategoryModelCopyWithImpl<$Res>
    implements _$AssetCategoryModelCopyWith<$Res> {
  __$AssetCategoryModelCopyWithImpl(this._self, this._then);

  final _AssetCategoryModel _self;
  final $Res Function(_AssetCategoryModel) _then;

/// Create a copy of AssetCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? baseLtv = null,Object? maxLtv = null,Object? annualDepreciationRate = null,Object? maxAgeYears = null,Object? requiresInsurance = null,Object? requiresValuation = null,Object? requiresInspection = null,Object? description = freezed,Object? icon = freezed,}) {
  return _then(_AssetCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,baseLtv: null == baseLtv ? _self.baseLtv : baseLtv // ignore: cast_nullable_to_non_nullable
as double,maxLtv: null == maxLtv ? _self.maxLtv : maxLtv // ignore: cast_nullable_to_non_nullable
as double,annualDepreciationRate: null == annualDepreciationRate ? _self.annualDepreciationRate : annualDepreciationRate // ignore: cast_nullable_to_non_nullable
as double,maxAgeYears: null == maxAgeYears ? _self.maxAgeYears : maxAgeYears // ignore: cast_nullable_to_non_nullable
as int,requiresInsurance: null == requiresInsurance ? _self.requiresInsurance : requiresInsurance // ignore: cast_nullable_to_non_nullable
as bool,requiresValuation: null == requiresValuation ? _self.requiresValuation : requiresValuation // ignore: cast_nullable_to_non_nullable
as bool,requiresInspection: null == requiresInspection ? _self.requiresInspection : requiresInspection // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
