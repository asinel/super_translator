import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_translator/data/favorite/i_favorite_repository.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

part 'translator_state.dart';
part 'translator_cubit.freezed.dart';

class TranslatorCubit extends Cubit<TranslatorState> {

  final ITranslatorRepository translatorRepository;
  final IFavoriteRepository favoriteRepository;

  TranslatorCubit(this.translatorRepository, this.favoriteRepository) : super(TranslatorState(
      supportedLanguages: [],
      isLoading: false,
      error: null,
      fromLanguage: Language.DETECT,
      toLanguage: Language('ru', 'Russian'),
      text: '',
      translations: []
  )) {
    fetchLanguages();
    this.favoriteRepository.watchTranslations().listen((data) {
      //Removes favorite status from translation which are not favorite in DB (deleted on favorites screen)
      //TODO proper SQL query with functional-style merging arrays. Current impl performs for O(M * N)
      var newTranslations = state.translations.map((element) =>
        (element.favoriteId != null && !data.any((dbEl) => dbEl.favoriteId == element.favoriteId)) ?
          element.copyWith(favoriteId: null) :
          element
      );
      emit(state.copyWith(translations: newTranslations.toList()));
    });
  }

  void fetchLanguages() async {
    emit(state.copyWith(isLoading: true));
    try {
      var languages = await translatorRepository.getSupportedLanguages();
      emit(state.copyWith(isLoading: false, supportedLanguages: languages));
    } on Exception catch (e) {
      emit(state.copyWith(isLoading: false, error: e));
    }
  }

  void changeFromLanguage(Language newLanguage) {
    if (newLanguage == state.toLanguage) {
      swapLanguages();
    } else {
      emit(state.copyWith(fromLanguage: newLanguage));
    }
  }

  void changeToLanguage(Language newLanguage) {
    if (newLanguage == state.fromLanguage) {
      swapLanguages();
    } else {
      emit(state.copyWith(toLanguage: newLanguage));
    }
  }

  void swapLanguages() => emit(state.copyWith(fromLanguage: state.toLanguage, toLanguage: state.fromLanguage));

  void textChanged(String text) => emit(state.copyWith(text: text));

  void submitText(String text) async {
    try {
      var translated = await translatorRepository.translate(text, state.fromLanguage, state.toLanguage);
      emit(state.copyWith(translations: [translated, ...state.translations], text: ''));
    } catch (e) {
      emit(state.copyWith(translations: [Translation(text, 'Error'), ...state.translations], text: ''));
    }
  }

  void addToFavorites(int index) async {
    var translationWithId = state.translations[index].copyWith(favoriteId: DateTime.now().millisecondsSinceEpoch);
    await favoriteRepository.insertTranslation(translationWithId);
    var translations = [...state.translations.getRange(0, index), translationWithId, ...state.translations.getRange(index + 1, state.translations.length)];
    emit(state.copyWith(text: '', translations: translations));
  }

  void removeFromFavorites(int index) async {
    var translation = state.translations[index];
    var translationWithoutId = translation.copyWith(favoriteId: null);
    var translations = [...state.translations.getRange(0, index), translationWithoutId, ...state.translations.getRange(index + 1, state.translations.length)];
    await favoriteRepository.removeTranslation(translation);
    emit(state.copyWith(text: '', translations: translations));
  }
}