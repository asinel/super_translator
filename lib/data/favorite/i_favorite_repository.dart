import 'package:super_translator/data/model/translation.dart';

abstract class IFavoriteRepository {

  Stream<List<Translation>> watchTranslations();

  Future<void> insertTranslation(Translation translation);

  Future<void> removeTranslation(Translation translation);

}
