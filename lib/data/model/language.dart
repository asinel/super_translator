import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

@freezed
class Language with _$Language {

  static final Language DETECT = Language('detect', 'Detect');

  factory Language(String code, String name) = _Language;
}

