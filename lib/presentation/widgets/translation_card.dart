import 'package:flutter/material.dart';
import 'package:super_translator/data/model/translation.dart';
import 'package:super_translator/domain/model/loadable.dart';

class TranslationCard extends StatelessWidget {

  final Loadable<Translation> translation;
  final VoidCallback? onPressed;

  TranslationCard(this.translation, { this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      translation.data.initialText,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      translation.data.translatedText,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (translation.data.detectedLanguage != null)
                      SizedBox(height: 16,),
                    if (translation.data.detectedLanguage != null)
                      Text(
                        'Detected language: ${translation.data.detectedLanguage!.name}',
                        style: TextStyle(color: Colors.grey),
                      )
                  ],
                )
              ),
              IconButton(
                icon: Icon(translation.data.favoriteId != null ? Icons.favorite : Icons.favorite_outline),
                onPressed: onPressed
            )
            ],
          ),
        )
    );
  }
}
