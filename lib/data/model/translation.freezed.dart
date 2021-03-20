// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TranslationTearOff {
  const _$TranslationTearOff();

  _Translation call(String initialText, String translatedText,
      {Language? detectedLanguage, int? favoriteId}) {
    return _Translation(
      initialText,
      translatedText,
      detectedLanguage: detectedLanguage,
      favoriteId: favoriteId,
    );
  }
}

/// @nodoc
const $Translation = _$TranslationTearOff();

/// @nodoc
mixin _$Translation {
  String get initialText => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  Language? get detectedLanguage => throw _privateConstructorUsedError;
  int? get favoriteId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TranslationCopyWith<Translation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationCopyWith<$Res> {
  factory $TranslationCopyWith(
          Translation value, $Res Function(Translation) then) =
      _$TranslationCopyWithImpl<$Res>;
  $Res call(
      {String initialText,
      String translatedText,
      Language? detectedLanguage,
      int? favoriteId});

  $LanguageCopyWith<$Res>? get detectedLanguage;
}

/// @nodoc
class _$TranslationCopyWithImpl<$Res> implements $TranslationCopyWith<$Res> {
  _$TranslationCopyWithImpl(this._value, this._then);

  final Translation _value;
  // ignore: unused_field
  final $Res Function(Translation) _then;

  @override
  $Res call({
    Object? initialText = freezed,
    Object? translatedText = freezed,
    Object? detectedLanguage = freezed,
    Object? favoriteId = freezed,
  }) {
    return _then(_value.copyWith(
      initialText: initialText == freezed
          ? _value.initialText
          : initialText // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText: translatedText == freezed
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      detectedLanguage: detectedLanguage == freezed
          ? _value.detectedLanguage
          : detectedLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      favoriteId: favoriteId == freezed
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $LanguageCopyWith<$Res>? get detectedLanguage {
    if (_value.detectedLanguage == null) {
      return null;
    }

    return $LanguageCopyWith<$Res>(_value.detectedLanguage!, (value) {
      return _then(_value.copyWith(detectedLanguage: value));
    });
  }
}

/// @nodoc
abstract class _$TranslationCopyWith<$Res>
    implements $TranslationCopyWith<$Res> {
  factory _$TranslationCopyWith(
          _Translation value, $Res Function(_Translation) then) =
      __$TranslationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String initialText,
      String translatedText,
      Language? detectedLanguage,
      int? favoriteId});

  @override
  $LanguageCopyWith<$Res>? get detectedLanguage;
}

/// @nodoc
class __$TranslationCopyWithImpl<$Res> extends _$TranslationCopyWithImpl<$Res>
    implements _$TranslationCopyWith<$Res> {
  __$TranslationCopyWithImpl(
      _Translation _value, $Res Function(_Translation) _then)
      : super(_value, (v) => _then(v as _Translation));

  @override
  _Translation get _value => super._value as _Translation;

  @override
  $Res call({
    Object? initialText = freezed,
    Object? translatedText = freezed,
    Object? detectedLanguage = freezed,
    Object? favoriteId = freezed,
  }) {
    return _then(_Translation(
      initialText == freezed
          ? _value.initialText
          : initialText // ignore: cast_nullable_to_non_nullable
              as String,
      translatedText == freezed
          ? _value.translatedText
          : translatedText // ignore: cast_nullable_to_non_nullable
              as String,
      detectedLanguage: detectedLanguage == freezed
          ? _value.detectedLanguage
          : detectedLanguage // ignore: cast_nullable_to_non_nullable
              as Language?,
      favoriteId: favoriteId == freezed
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
class _$_Translation implements _Translation {
  _$_Translation(this.initialText, this.translatedText,
      {this.detectedLanguage, this.favoriteId});

  @override
  final String initialText;
  @override
  final String translatedText;
  @override
  final Language? detectedLanguage;
  @override
  final int? favoriteId;

  @override
  String toString() {
    return 'Translation(initialText: $initialText, translatedText: $translatedText, detectedLanguage: $detectedLanguage, favoriteId: $favoriteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Translation &&
            (identical(other.initialText, initialText) ||
                const DeepCollectionEquality()
                    .equals(other.initialText, initialText)) &&
            (identical(other.translatedText, translatedText) ||
                const DeepCollectionEquality()
                    .equals(other.translatedText, translatedText)) &&
            (identical(other.detectedLanguage, detectedLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.detectedLanguage, detectedLanguage)) &&
            (identical(other.favoriteId, favoriteId) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteId, favoriteId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(initialText) ^
      const DeepCollectionEquality().hash(translatedText) ^
      const DeepCollectionEquality().hash(detectedLanguage) ^
      const DeepCollectionEquality().hash(favoriteId);

  @JsonKey(ignore: true)
  @override
  _$TranslationCopyWith<_Translation> get copyWith =>
      __$TranslationCopyWithImpl<_Translation>(this, _$identity);
}

abstract class _Translation implements Translation {
  factory _Translation(String initialText, String translatedText,
      {Language? detectedLanguage, int? favoriteId}) = _$_Translation;

  @override
  String get initialText => throw _privateConstructorUsedError;
  @override
  String get translatedText => throw _privateConstructorUsedError;
  @override
  Language? get detectedLanguage => throw _privateConstructorUsedError;
  @override
  int? get favoriteId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TranslationCopyWith<_Translation> get copyWith =>
      throw _privateConstructorUsedError;
}
