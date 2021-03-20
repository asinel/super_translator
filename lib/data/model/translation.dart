import 'language.dart';

class Translation {
  final String initialText;
  final String translatedText;
  final Language fromLanguage;
  final Language toLanguage;

  Translation(this.initialText, this.translatedText, this.fromLanguage, this.toLanguage);
}