// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'loadable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoadableTearOff {
  const _$LoadableTearOff();

  _Loadable<T> call<T>(int key, T data,
      {bool isLoading = false, Exception? error}) {
    return _Loadable<T>(
      key,
      data,
      isLoading: isLoading,
      error: error,
    );
  }
}

/// @nodoc
const $Loadable = _$LoadableTearOff();

/// @nodoc
mixin _$Loadable<T> {
  int get key => throw _privateConstructorUsedError;
  T get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadableCopyWith<T, Loadable<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadableCopyWith<T, $Res> {
  factory $LoadableCopyWith(
          Loadable<T> value, $Res Function(Loadable<T>) then) =
      _$LoadableCopyWithImpl<T, $Res>;
  $Res call({int key, T data, bool isLoading, Exception? error});
}

/// @nodoc
class _$LoadableCopyWithImpl<T, $Res> implements $LoadableCopyWith<T, $Res> {
  _$LoadableCopyWithImpl(this._value, this._then);

  final Loadable<T> _value;
  // ignore: unused_field
  final $Res Function(Loadable<T>) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? data = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
abstract class _$LoadableCopyWith<T, $Res>
    implements $LoadableCopyWith<T, $Res> {
  factory _$LoadableCopyWith(
          _Loadable<T> value, $Res Function(_Loadable<T>) then) =
      __$LoadableCopyWithImpl<T, $Res>;
  @override
  $Res call({int key, T data, bool isLoading, Exception? error});
}

/// @nodoc
class __$LoadableCopyWithImpl<T, $Res> extends _$LoadableCopyWithImpl<T, $Res>
    implements _$LoadableCopyWith<T, $Res> {
  __$LoadableCopyWithImpl(
      _Loadable<T> _value, $Res Function(_Loadable<T>) _then)
      : super(_value, (v) => _then(v as _Loadable<T>));

  @override
  _Loadable<T> get _value => super._value as _Loadable<T>;

  @override
  $Res call({
    Object? key = freezed,
    Object? data = freezed,
    Object? isLoading = freezed,
    Object? error = freezed,
  }) {
    return _then(_Loadable<T>(
      key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as int,
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc
class _$_Loadable<T> implements _Loadable<T> {
  _$_Loadable(this.key, this.data, {this.isLoading = false, this.error});

  @override
  final int key;
  @override
  final T data;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'Loadable<$T>(key: $key, data: $data, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loadable<T> &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$LoadableCopyWith<T, _Loadable<T>> get copyWith =>
      __$LoadableCopyWithImpl<T, _Loadable<T>>(this, _$identity);
}

abstract class _Loadable<T> implements Loadable<T> {
  factory _Loadable(int key, T data, {bool isLoading, Exception? error}) =
      _$_Loadable<T>;

  @override
  int get key => throw _privateConstructorUsedError;
  @override
  T get data => throw _privateConstructorUsedError;
  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Exception? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadableCopyWith<T, _Loadable<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
