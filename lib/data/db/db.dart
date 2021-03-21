import 'package:moor/moor.dart';

export 'platform/shared.dart';

part 'db.g.dart';

class Translations extends Table {
  IntColumn get id => integer()();
  TextColumn get initialText => text()();
  TextColumn get translatedText => text()();
  TextColumn get sourceLanguage => text()();
  TextColumn get targetLanguage => text()();

  @override
  Set<Column> get primaryKey => { id };
}

@UseMoor(tables: [Translations])
class MyDatabase extends _$MyDatabase {

  MyDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<List<Translation>> getAllTranslations() => select(translations).get();

  Stream<List<Translation>> watchAllTranslations() => select(translations).watch();

  Future<int> insertTranslation(Translation translation) => into(translations).insert(translation);

  Future<int> deleteTranslation(Translation translation) => (delete(translations)..whereSamePrimaryKey(translation)).go();
}