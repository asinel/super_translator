part of 'translator_cubit.dart';

@freezed
class TranslatorState with _$TranslatorState {

  factory TranslatorState({
    required List<Language> supportedLanguages,
    required bool isLoading,
    required Exception? error,
    required Language fromLanguage,
    required Language toLanguage,
    required String text,
    required List<Loadable<Translation>> translations
  }) = _TranslatorState;
}