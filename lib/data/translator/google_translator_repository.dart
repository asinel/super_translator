import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

class GoogleTranslatorRepository extends ITranslatorRepository {

  final String baseUrl;
  final String apiKey;

  GoogleTranslatorRepository(this.baseUrl, this.apiKey);

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
    var response = await http.post(
      Uri.parse('$baseUrl/language/translate/v2'),
      body: {
        'q': text,
        if (from != Language.DETECT) 'source': from.code,
        'target': to.code,
        'format': 'text',
        'key': apiKey
      }
    );
    if (response.statusCode == 200) {
      var translations = jsonDecode(response.body)['data']['translations'];
      var translatedText = translations[0]['translatedText'] as String;
      var detectedLanguage = translations[0]['detectedSourceLanguage'] as String?;
      return Translation(text, translatedText, detectedLanguage: detectedLanguage != null ? Language(detectedLanguage, detectedLanguage) : null);
    } else {
      throw HttpException(response.reasonPhrase ?? 'Unknown error', uri: response.request?.url);
    }
  }

}