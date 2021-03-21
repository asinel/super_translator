import 'package:freezed_annotation/freezed_annotation.dart';

import 'language.dart';

part 'translation.freezed.dart';

@freezed
class Translation with _$Translation {

  factory Translation(String initialText, String translatedText, Language source, Language target, {Language? detectedLanguage, int? favoriteId}) = _Translation;
}