import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Translations])
class MyDatabase extends _$MyDatabase {

  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Translation>> getAllTranslations() => select(translations).get();

  Stream<List<Translation>> watchAllTranslations() => select(translations).watch();

  Future<int> insertTranslation(Translation translation) => into(translations).insert(translation);

  Future<int> deleteTranslation(Translation translation) => (delete(translations)..whereSamePrimaryKey(translation)).go();
}