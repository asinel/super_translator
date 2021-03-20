import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/data/favorite/i_favorite_repository.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

part 'translator_state.dart';

class TranslatorCubit extends Cubit<TranslatorState> {

  final ITranslatorRepository translatorRepository;
  final IFavoriteRepository favoriteRepository;

  TranslatorCubit(this.translatorRepository, this.favoriteRepository) : super(TranslatorState(fromLanguage: Language('auto', 'Detect'), toLanguage: Language('ru', 'Russian'), text: '', translations: [])) {
    this.favoriteRepository.watchTranslations().listen((data) {
      //Removes favorite status from translation which are not favorite in DB (deleted on favorites screen)
      //TODO proper SQL query with functional-style merging arrays. Current impl performs for O(M * N)
      var newTranslations = state.translations.map((element) =>
        (element.favoriteId != null && !data.any((dbEl) => dbEl.favoriteId == element.favoriteId)) ?
          Translation(element.initialText, element.translatedText, detectedLanguage: element.detectedLanguage, favoriteId: null) :
          element
      );
      emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: state.toLanguage, text: state.text, translations: newTranslations.toList()));
    });
  }

  void changeFromLanguage(Language newLanguage) => emit(TranslatorState(fromLanguage: newLanguage, toLanguage: state.toLanguage, text: state.text, translations: state.translations));

  void changeToLanguage(Language newLanguage) => emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: newLanguage, text: state.text, translations: state.translations));

  void swapLanguages() => emit(TranslatorState(fromLanguage: state.toLanguage, toLanguage: state.fromLanguage, text: state.text, translations: state.translations));

  void textChanged(String text) => emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: state.toLanguage, text: text, translations: state.translations));

  void submitText(String text) async {
    try {
      var translated = await translatorRepository.translate(text, state.fromLanguage, state.toLanguage);
      emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: state.toLanguage, text: '', translations: [translated, ...state.translations]));
    } catch (e) {
      emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: state.toLanguage, text: '', translations: [Translation(text, 'Error'), ...state.translations]));
    }
  }

  void addToFavorites(int index) async {
    var translation = state.translations[index];
    var translationWithId = Translation(translation.initialText, translation.translatedText, detectedLanguage: translation.detectedLanguage, favoriteId: DateTime.now().millisecondsSinceEpoch);
    await favoriteRepository.insertTranslation(translationWithId);
    var translations = [...state.translations.getRange(0, index), translationWithId, ...state.translations.getRange(index + 1, state.translations.length)];
    emit(TranslatorState(
        fromLanguage: state.fromLanguage,
        toLanguage: state.toLanguage,
        text: '',
        translations: translations)
    );
  }

  void removeFromFavorites(int index) async {
    var translation = state.translations[index];
    var translationWithoutId = Translation(translation.initialText, translation.translatedText, detectedLanguage: translation.detectedLanguage, favoriteId: null);
    var translations = [...state.translations.getRange(0, index), translationWithoutId, ...state.translations.getRange(index + 1, state.translations.length)];
    await favoriteRepository.removeTranslation(translation);
    emit(TranslatorState(
        fromLanguage: state.fromLanguage,
        toLanguage: state.toLanguage,
        text: '',
        translations: translations)
    );
  }
}