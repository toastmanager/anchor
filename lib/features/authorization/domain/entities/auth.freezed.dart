// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEntity {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of SignInEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInEntityCopyWith<SignInEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEntityCopyWith<$Res> {
  factory $SignInEntityCopyWith(
          SignInEntity value, $Res Function(SignInEntity) then) =
      _$SignInEntityCopyWithImpl<$Res, SignInEntity>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInEntityCopyWithImpl<$Res, $Val extends SignInEntity>
    implements $SignInEntityCopyWith<$Res> {
  _$SignInEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInEntityImplCopyWith<$Res>
    implements $SignInEntityCopyWith<$Res> {
  factory _$$SignInEntityImplCopyWith(
          _$SignInEntityImpl value, $Res Function(_$SignInEntityImpl) then) =
      __$$SignInEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInEntityImplCopyWithImpl<$Res>
    extends _$SignInEntityCopyWithImpl<$Res, _$SignInEntityImpl>
    implements _$$SignInEntityImplCopyWith<$Res> {
  __$$SignInEntityImplCopyWithImpl(
      _$SignInEntityImpl _value, $Res Function(_$SignInEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInEntityImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInEntityImpl implements _SignInEntity {
  const _$SignInEntityImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInEntity(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEntityImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of SignInEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEntityImplCopyWith<_$SignInEntityImpl> get copyWith =>
      __$$SignInEntityImplCopyWithImpl<_$SignInEntityImpl>(this, _$identity);
}

abstract class _SignInEntity implements SignInEntity {
  const factory _SignInEntity(
      {required final String email,
      required final String password}) = _$SignInEntityImpl;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignInEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInEntityImplCopyWith<_$SignInEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SignUpEntity {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  DateTime get birthDate => throw _privateConstructorUsedError;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpEntityCopyWith<SignUpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEntityCopyWith<$Res> {
  factory $SignUpEntityCopyWith(
          SignUpEntity value, $Res Function(SignUpEntity) then) =
      _$SignUpEntityCopyWithImpl<$Res, SignUpEntity>;
  @useResult
  $Res call(
      {String email, String password, String fullName, DateTime birthDate});
}

/// @nodoc
class _$SignUpEntityCopyWithImpl<$Res, $Val extends SignUpEntity>
    implements $SignUpEntityCopyWith<$Res> {
  _$SignUpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
    Object? birthDate = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpEntityImplCopyWith<$Res>
    implements $SignUpEntityCopyWith<$Res> {
  factory _$$SignUpEntityImplCopyWith(
          _$SignUpEntityImpl value, $Res Function(_$SignUpEntityImpl) then) =
      __$$SignUpEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String password, String fullName, DateTime birthDate});
}

/// @nodoc
class __$$SignUpEntityImplCopyWithImpl<$Res>
    extends _$SignUpEntityCopyWithImpl<$Res, _$SignUpEntityImpl>
    implements _$$SignUpEntityImplCopyWith<$Res> {
  __$$SignUpEntityImplCopyWithImpl(
      _$SignUpEntityImpl _value, $Res Function(_$SignUpEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullName = null,
    Object? birthDate = null,
  }) {
    return _then(_$SignUpEntityImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SignUpEntityImpl implements _SignUpEntity {
  const _$SignUpEntityImpl(
      {required this.email,
      required this.password,
      required this.fullName,
      required this.birthDate});

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final DateTime birthDate;

  @override
  String toString() {
    return 'SignUpEntity(email: $email, password: $password, fullName: $fullName, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpEntityImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, fullName, birthDate);

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpEntityImplCopyWith<_$SignUpEntityImpl> get copyWith =>
      __$$SignUpEntityImplCopyWithImpl<_$SignUpEntityImpl>(this, _$identity);
}

abstract class _SignUpEntity implements SignUpEntity {
  const factory _SignUpEntity(
      {required final String email,
      required final String password,
      required final String fullName,
      required final DateTime birthDate}) = _$SignUpEntityImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullName;
  @override
  DateTime get birthDate;

  /// Create a copy of SignUpEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpEntityImplCopyWith<_$SignUpEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
