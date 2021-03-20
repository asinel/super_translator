part of 'translator_cubit.dart';

@freezed
class TranslatorState with _$TranslatorState {

  factory TranslatorState({required Language fromLanguage, required Language toLanguage, required String text, required List<Translation> translations}) = _TranslatorState;
}