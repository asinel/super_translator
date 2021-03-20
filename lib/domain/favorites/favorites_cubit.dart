import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_translator/data/favorite/i_favorite_repository.dart';
import 'package:super_translator/data/model/translation.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {

  final IFavoriteRepository favoriteRepository;

  FavoritesCubit(this.favoriteRepository) : super(FavoritesState([])) {
    this.favoriteRepository.watchTranslations().listen((translations) {
      emit(FavoritesState(translations));
    });
  }

  void removeFromFavorite(Translation translation) async {
    await favoriteRepository.removeTranslation(translation);
  }
}