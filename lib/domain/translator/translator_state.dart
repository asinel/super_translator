part of 'translator_cubit.dart';

class TranslatorState extends Equatable {

  final Language fromLanguage;
  final Language toLanguage;
  final String text;
  final List<Translation> translations;

  TranslatorState({required this.fromLanguage, required this.toLanguage, required this.text, required this.translations});

  @override
  List<Object> get props => [fromLanguage, toLanguage, text, translations];
}