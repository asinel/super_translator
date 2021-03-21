part of 'translator_cubit.dart';

@freezed
class TranslatorState with _$TranslatorState {

  factory TranslatorState({
    required Loadable<List<Language>> supportedLanguages,
    required Language fromLanguage,
    required Language toLanguage,
    required String text,
    required List<Loadable<Translation>> translations
  }) = _TranslatorState;
}