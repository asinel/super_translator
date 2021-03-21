import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

class DummyTranslatorRepository extends ITranslatorRepository {

  @override
  Future<List<Language>> getSupportedLanguages() async {
    await Future.delayed(Duration(seconds: 3));
    return [
      Language('en', 'English'),
      Language('cs', 'Czech'),
      Language('ru', 'Russian'),
    ];
  }

  @override
  Future<Translation> translate(String text, Language from, Language to) async {
    return Translation(
      text,
      String.fromCharCodes(text.codeUnits.reversed),
      Language('en', 'English'),
      Language('ru', 'Russian'),
    );
  }

}