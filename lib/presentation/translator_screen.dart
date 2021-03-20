import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/data/language_list.dart';
import 'package:super_translator/data/model/language.dart';
import 'package:super_translator/domain/translator/translator_cubit.dart';

class TranslatorScreen extends StatelessWidget {

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslatorCubit, TranslatorState>(
      listener: (context, state) {
        _textController.text = state.text;
      },
      builder: (context, state) => Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButton<Language>(
                          value: state.fromLanguage,
                          onChanged: (newValue) {
                            context.read<TranslatorCubit>().changeFromLanguage(newValue);
                          },
                          items: LanguageList.listWithDetect.map((e) => DropdownMenuItem<Language>(value: e, child: Text(e.name))).toList(),
                          isExpanded: true,
                        )
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(Icons.compare_arrows),
                      ),
                      Expanded(
                        child: DropdownButton<Language>(
                          value: state.toLanguage,
                          onChanged: (newValue) {
                            context.read<TranslatorCubit>().changeFromLanguage(newValue);
                          },
                          items: LanguageList.listWithoutDetect.map((e) => DropdownMenuItem<Language>(value: e, child: Text(e.name))).toList(),
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
                    onSubmitted: (text) {
                      context.read<TranslatorCubit>().submitText(text);
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text('Translations', style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.translations.length,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        state.translations[index].initialText,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        state.translations[index].translatedText,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
