import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

class DummyTranslatorRepository extends ITranslatorRepository {

  @override
  Future<Translation> translate(String text, Language from, Language to) async {
    return Translation(
      text,
      String.fromCharCodes(text.codeUnits.reversed),
      from,
      to
    );
  }

}