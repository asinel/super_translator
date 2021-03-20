import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/domain/favorites/favorites_cubit.dart';
import 'package:super_translator/presentation/widgets/translation_card.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) => ListView.builder(
        itemCount: state.translations.length,
        itemBuilder: (context, index) => TranslationCard(
          initialText: state.translations[index].initialText,
          translatedText: state.translations[index].translatedText,
          detectedLanguage: state.translations[index].detectedLanguage,
          isFavorite: state.translations[index].favoriteId != null,
          onPressed: () {
            context.read<FavoritesCubit>().removeFromFavorite(state.translations[index]);
          }
        )
      ),
    );
  }
}
