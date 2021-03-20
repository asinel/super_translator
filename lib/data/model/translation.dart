import 'language.dart';

class Translation {
  final String initialText;
  final String translatedText;
  final Language? detectedLanguage;
  final int? favoriteId;

  Translation(this.initialText, this.translatedText, { this.detectedLanguage, this.favoriteId });
}