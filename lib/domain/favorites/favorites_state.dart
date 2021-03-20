part of 'favorites_cubit.dart';


class FavoritesState extends Equatable {

  final List<Translation> translations;

  FavoritesState(this.translations);

  @override
  List<Object> get props => [translations];

}