import 'model/language.dart';

class LanguageList {

  static final List<Language> listWithoutDetect = [
    Language('en', 'English'),
    Language('cs', 'Czech'),
    Language('ru', 'Russian'),
  ];

  static final List<Language> listWithDetect = [ Language('auto', 'Detect') ] + listWithoutDetect;
}