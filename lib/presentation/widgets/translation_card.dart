import 'package:flutter/material.dart';
import 'package:super_translator/data/model/language.dart';

class TranslationCard extends StatelessWidget {

  final String initialText;
  final String translatedText;
  final Language? detectedLanguage;
  final bool isFavorite;
  final VoidCallback onPressed;

  TranslationCard({required this.initialText, required this.translatedText, required this.detectedLanguage, required this.isFavorite, required this.onPressed});

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
                      initialText,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      translatedText,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (detectedLanguage != null)
                      SizedBox(height: 16,),
                    if (detectedLanguage != null)
                      Text(
                        'Detected language: ${detectedLanguage!.name}',
                        style: TextStyle(color: Colors.grey),
                      )
                  ],
                )
              ),
              IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
                onPressed: onPressed
            )
            ],
          ),
        )
    );
  }
}
