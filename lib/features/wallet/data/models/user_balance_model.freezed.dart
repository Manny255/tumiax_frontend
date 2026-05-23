// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserBalanceModel {

 String get id; double get balance;@JsonKey(name: 'total_deposited') double get totalDeposited;@JsonKey(name: 'total_withdrawn') double get totalWithdrawn;@JsonKey(name: 'is_frozen') bool get isFrozen;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserBalanceModelCopyWith<UserBalanceModel> get copyWith => _$UserBalanceModelCopyWithImpl<UserBalanceModel>(this as UserBalanceModel, _$identity);

  /// Serializes this UserBalanceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserBalanceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.totalDeposited, totalDeposited) || other.totalDeposited == totalDeposited)&&(identical(other.totalWithdrawn, totalWithdrawn) || other.totalWithdrawn == totalWithdrawn)&&(identical(other.isFrozen, isFrozen) || other.isFrozen == isFrozen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,balance,totalDeposited,totalWithdrawn,isFrozen,createdAt,updatedAt);

@override
String toString() {
  return 'UserBalanceModel(id: $id, balance: $balance, totalDeposited: $totalDeposited, totalWithdrawn: $totalWithdrawn, isFrozen: $isFrozen, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserBalanceModelCopyWith<$Res>  {
  factory $UserBalanceModelCopyWith(UserBalanceModel value, $Res Function(UserBalanceModel) _then) = _$UserBalanceModelCopyWithImpl;
@useResult
$Res call({
 String id, double balance,@JsonKey(name: 'total_deposited') double totalDeposited,@JsonKey(name: 'total_withdrawn') double totalWithdrawn,@JsonKey(name: 'is_frozen') bool isFrozen,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$UserBalanceModelCopyWithImpl<$Res>
    implements $UserBalanceModelCopyWith<$Res> {
  _$UserBalanceModelCopyWithImpl(this._self, this._then);

  final UserBalanceModel _self;
  final $Res Function(UserBalanceModel) _then;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? balance = null,Object? totalDeposited = null,Object? totalWithdrawn = null,Object? isFrozen = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,totalDeposited: null == totalDeposited ? _self.totalDeposited : totalDeposited // ignore: cast_nullable_to_non_nullable
as double,totalWithdrawn: null == totalWithdrawn ? _self.totalWithdrawn : totalWithdrawn // ignore: cast_nullable_to_non_nullable
as double,isFrozen: null == isFrozen ? _self.isFrozen : isFrozen // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserBalanceModel].
extension UserBalanceModelPatterns on UserBalanceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserBalanceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserBalanceModel value)  $default,){
final _that = this;
switch (_that) {
case _UserBalanceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserBalanceModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double balance, @JsonKey(name: 'total_deposited')  double totalDeposited, @JsonKey(name: 'total_withdrawn')  double totalWithdrawn, @JsonKey(name: 'is_frozen')  bool isFrozen, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
return $default(_that.id,_that.balance,_that.totalDeposited,_that.totalWithdrawn,_that.isFrozen,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double balance, @JsonKey(name: 'total_deposited')  double totalDeposited, @JsonKey(name: 'total_withdrawn')  double totalWithdrawn, @JsonKey(name: 'is_frozen')  bool isFrozen, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserBalanceModel():
return $default(_that.id,_that.balance,_that.totalDeposited,_that.totalWithdrawn,_that.isFrozen,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double balance, @JsonKey(name: 'total_deposited')  double totalDeposited, @JsonKey(name: 'total_withdrawn')  double totalWithdrawn, @JsonKey(name: 'is_frozen')  bool isFrozen, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserBalanceModel() when $default != null:
return $default(_that.id,_that.balance,_that.totalDeposited,_that.totalWithdrawn,_that.isFrozen,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserBalanceModel implements UserBalanceModel {
  const _UserBalanceModel({required this.id, required this.balance, @JsonKey(name: 'total_deposited') required this.totalDeposited, @JsonKey(name: 'total_withdrawn') required this.totalWithdrawn, @JsonKey(name: 'is_frozen') required this.isFrozen, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserBalanceModel.fromJson(Map<String, dynamic> json) => _$UserBalanceModelFromJson(json);

@override final  String id;
@override final  double balance;
@override@JsonKey(name: 'total_deposited') final  double totalDeposited;
@override@JsonKey(name: 'total_withdrawn') final  double totalWithdrawn;
@override@JsonKey(name: 'is_frozen') final  bool isFrozen;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserBalanceModelCopyWith<_UserBalanceModel> get copyWith => __$UserBalanceModelCopyWithImpl<_UserBalanceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserBalanceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserBalanceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.totalDeposited, totalDeposited) || other.totalDeposited == totalDeposited)&&(identical(other.totalWithdrawn, totalWithdrawn) || other.totalWithdrawn == totalWithdrawn)&&(identical(other.isFrozen, isFrozen) || other.isFrozen == isFrozen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,balance,totalDeposited,totalWithdrawn,isFrozen,createdAt,updatedAt);

@override
String toString() {
  return 'UserBalanceModel(id: $id, balance: $balance, totalDeposited: $totalDeposited, totalWithdrawn: $totalWithdrawn, isFrozen: $isFrozen, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserBalanceModelCopyWith<$Res> implements $UserBalanceModelCopyWith<$Res> {
  factory _$UserBalanceModelCopyWith(_UserBalanceModel value, $Res Function(_UserBalanceModel) _then) = __$UserBalanceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, double balance,@JsonKey(name: 'total_deposited') double totalDeposited,@JsonKey(name: 'total_withdrawn') double totalWithdrawn,@JsonKey(name: 'is_frozen') bool isFrozen,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$UserBalanceModelCopyWithImpl<$Res>
    implements _$UserBalanceModelCopyWith<$Res> {
  __$UserBalanceModelCopyWithImpl(this._self, this._then);

  final _UserBalanceModel _self;
  final $Res Function(_UserBalanceModel) _then;

/// Create a copy of UserBalanceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? balance = null,Object? totalDeposited = null,Object? totalWithdrawn = null,Object? isFrozen = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserBalanceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double,totalDeposited: null == totalDeposited ? _self.totalDeposited : totalDeposited // ignore: cast_nullable_to_non_nullable
as double,totalWithdrawn: null == totalWithdrawn ? _self.totalWithdrawn : totalWithdrawn // ignore: cast_nullable_to_non_nullable
as double,isFrozen: null == isFrozen ? _self.isFrozen : isFrozen // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
