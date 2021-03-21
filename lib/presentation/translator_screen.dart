import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/domain/translator/translator_cubit.dart';

import 'widgets/translation_card.dart';

class TranslatorScreen extends StatelessWidget {

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslatorCubit, TranslatorState>(
      listenWhen: (context, state) => _textController.text != state.text,
      listener: (context, state) {
        _textController.text = state.text;
      },
      builder: (context, state) => Column(
        children: [
          state.isLoading ? translatorLoadingCard(context, state) :
            (state.error != null) ? translatorErrorCard(context, state) :
            translatorLoadedCard(context, state),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Translations', style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.translations.length,
              itemBuilder: (context, index) => TranslationCard(
                state.translations[index],
                onPressed: () {
                  if (state.translations[index].data.favoriteId == null) {
                    context.read<TranslatorCubit>().addToFavorites(index);
                  } else {
                    context.read<TranslatorCubit>().removeFromFavorites(index);
                  }
                }
              )
            ),
          )
        ],
      ),
    );
  }

  final double translatorCardHeight = 128.0;

  Widget translatorLoadingCard(BuildContext context, TranslatorState state) => Card(
    child: Container(
      width: double.infinity,
      height: translatorCardHeight,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );

  Widget translatorErrorCard(BuildContext context, TranslatorState state) => Card(
    child: Container(
      width: double.infinity,
      height: translatorCardHeight, //same as translatorLoadedCard
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.autorenew),
            onPressed: () => context.read<TranslatorCubit>().fetchLanguages()
          ),
          Text('Unknown error. Press renew to try again')
        ],
      ),
    ),
  );

  Widget translatorLoadedCard(BuildContext context, TranslatorState state) => Card(
    child: Container(
      width: double.infinity,
      height: translatorCardHeight,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButton<Language>(
                  value: state.fromLanguage,
                  onChanged: (newValue) => context.read<TranslatorCubit>().changeFromLanguage(newValue!),
                  items: ([Language.DETECT] + state.supportedLanguages).map((e) => DropdownMenuItem<Language>(value: e, child: Text(e.name))).toList(),
                  isExpanded: true,
                )
              ),
              IconButton(
                icon: Icon(Icons.compare_arrows),
                onPressed: state.fromLanguage != Language.DETECT ?
                  () => context.read<TranslatorCubit>().swapLanguages()
                  : null,
              ),
              Expanded(
                child: DropdownButton<Language>(
                  value: state.toLanguage,
                  onChanged: (newValue) => context.read<TranslatorCubit>().changeToLanguage(newValue!),
                  items: state.supportedLanguages.map((e) => DropdownMenuItem<Language>(value: e, child: Text(e.name))).toList(),
                  isExpanded: true,
                )
              ),
            ],
          ),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Enter the text to translate'
            ),
            onChanged: (text) => context.read<TranslatorCubit>().textChanged(text),
            onSubmitted: (text) => context.read<TranslatorCubit>().submitText(text),
          )
        ],
      ),
    ),
  );
}
