import 'language.dart';

class Translation {
  final String initialText;
  final String translatedText;
  final Language? detectedLanguage;

  Translation(this.initialText, this.translatedText, { this.detectedLanguage });
}