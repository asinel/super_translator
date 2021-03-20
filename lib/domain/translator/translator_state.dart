part of 'translator_cubit.dart';

class TranslatorState extends Equatable {

  final Language fromLanguage;
  final Language toLanguage;
  final String text;
  final List<Translation> translations;

  TranslatorState({this.fromLanguage, this.toLanguage, this.text, this.translations});

  @override
  List<Object> get props => [fromLanguage, toLanguage, text, translations];
}