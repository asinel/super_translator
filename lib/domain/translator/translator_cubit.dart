import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/data/translator/i_translator_repository.dart';

part 'translator_state.dart';

class TranslatorCubit extends Cubit<TranslatorState> {

  final ITranslatorRepository translatorRepository;

  TranslatorCubit({@required this.translatorRepository}) : super(TranslatorState(fromLanguage: Language('auto', 'Detect'), toLanguage: Language('ru', 'Russian'), text: '', translations: []));

  void changeFromLanguage(Language newLanguage) => emit(TranslatorState(fromLanguage: newLanguage, toLanguage: state.toLanguage, text: state.text, translations: state.translations));

  void changeToLanguage(Language newLanguage) => emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: newLanguage, text: state.text, translations: state.translations));

  void submitText(String text) => translatorRepository.translate(text, state.fromLanguage, state.toLanguage)
      .then((value) => emit(TranslatorState(fromLanguage: state.fromLanguage, toLanguage: state.toLanguage, text: '', translations: state.translations..add(value))));
}