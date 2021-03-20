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
  Future<Translation> translate(String text, Language from, Language to) async {
    var response = await http.post(
      Uri.parse('$baseUrl/language/translate/v2'),
      body: {
        'q': text,
        if (from.code != 'auto') 'source': from.code,
        'target': to.code,
        'format': 'text',
        'key': apiKey
      }
    );
    if (response.statusCode == 200) {
      var translations = jsonDecode(response.body)['data']['translations'];
      var translatedText = translations[0]['translatedText'] as String;
      return Translation(text, translatedText, from, to);
    } else {
      throw HttpException(response.reasonPhrase, uri: response.request.url);
    }
  }

}