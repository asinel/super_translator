import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:super_translator/data/favorite/i_favorite_repository.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';
import 'package:super_translator/domain/model/loadable.dart';

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
        (element.data.favoriteId != null && !data.any((dbEl) => dbEl.favoriteId == element.data.favoriteId)) ?
          element.copyWith(data: element.data.copyWith(favoriteId: null)) :
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
    var id = DateTime.now().millisecondsSinceEpoch;
    var newTranslation = Loadable<Translation>(id, Translation(text, '', state.fromLanguage, state.toLanguage), isLoading: true);
    emit(state.copyWith(translations: [newTranslation, ...state.translations], text: ''));
    try {
      var translated = await translatorRepository.translate(text, state.fromLanguage, state.toLanguage);
      int index = state.translations.indexWhere((element) => element.key == id);
      var translations = [
        ...state.translations.getRange(0, index),
        newTranslation.copyWith(data: translated, isLoading: false),
        ...state.translations.getRange(index + 1, state.translations.length)
      ];
      emit(state.copyWith(translations: translations));
    } on Exception catch (e) {
      int index = state.translations.indexWhere((element) => element.key == id);
      var translations = [
        ...state.translations.getRange(0, index),
        newTranslation.copyWith(error: e, isLoading: false),
        ...state.translations.getRange(index + 1, state.translations.length)
      ];
      emit(state.copyWith(translations: translations));
    }
  }

  void addToFavorites(int index) async {
    var translationWithId = state.translations[index].data.copyWith(favoriteId: DateTime.now().millisecondsSinceEpoch);
    var translations = [
      ...state.translations.getRange(0, index),
      state.translations[index].copyWith(data: translationWithId),
      ...state.translations.getRange(index + 1, state.translations.length)
    ];
    emit(state.copyWith(text: '', translations: translations));
    favoriteRepository.insertTranslation(translationWithId);
  }

  void removeFromFavorites(int index) async {
    favoriteRepository.removeTranslation(state.translations[index].data);
    var translationWithoutId = state.translations[index].data.copyWith(favoriteId: null);
    var translations = [
      ...state.translations.getRange(0, index),
      state.translations[index].copyWith(data: translationWithoutId),
      ...state.translations.getRange(index + 1, state.translations.length)
    ];
    emit(state.copyWith(text: '', translations: translations));
  }

  void refetchTranslation(int index) async {
    var translation = state.translations[index].copyWith(error: null, isLoading: true);
    String text = translation.data.initialText;
    var translations = [
      ...state.translations.getRange(0, index),
      translation,
      ...state.translations.getRange(index + 1, state.translations.length)
    ];
    emit(state.copyWith(translations: translations));
    try {
      var translated = await translatorRepository.translate(text, translation.data.source, translation.data.target);
      int index = state.translations.indexWhere((element) => element.key == translation.key);
      var translations = [
        ...state.translations.getRange(0, index),
        translation.copyWith(data: translated, isLoading: false),
        ...state.translations.getRange(index + 1, state.translations.length)
      ];
      emit(state.copyWith(translations: translations));
    } on Exception catch (e) {
      int index = state.translations.indexWhere((element) => element.key == translation.key);
      var translations = [
        ...state.translations.getRange(0, index),
        translation.copyWith(error: e, isLoading: false),
        ...state.translations.getRange(index + 1, state.translations.length)
      ];
      emit(state.copyWith(translations: translations));
    }
  }
}