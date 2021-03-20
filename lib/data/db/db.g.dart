// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Translation extends DataClass implements Insertable<Translation> {
  final int id;
  final String initialText;
  final String translatedText;
  Translation(
      {required this.id,
      required this.initialText,
      required this.translatedText});
  factory Translation.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Translation(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      initialText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}initial_text'])!,
      translatedText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}translated_text'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['initial_text'] = Variable<String>(initialText);
    map['translated_text'] = Variable<String>(translatedText);
    return map;
  }

  TranslationsCompanion toCompanion(bool nullToAbsent) {
    return TranslationsCompanion(
      id: Value(id),
      initialText: Value(initialText),
      translatedText: Value(translatedText),
    );
  }

  factory Translation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Translation(
      id: serializer.fromJson<int>(json['id']),
      initialText: serializer.fromJson<String>(json['initialText']),
      translatedText: serializer.fromJson<String>(json['translatedText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'initialText': serializer.toJson<String>(initialText),
      'translatedText': serializer.toJson<String>(translatedText),
    };
  }

  Translation copyWith(
          {int? id, String? initialText, String? translatedText}) =>
      Translation(
        id: id ?? this.id,
        initialText: initialText ?? this.initialText,
        translatedText: translatedText ?? this.translatedText,
      );
  @override
  String toString() {
    return (StringBuffer('Translation(')
          ..write('id: $id, ')
          ..write('initialText: $initialText, ')
          ..write('translatedText: $translatedText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(initialText.hashCode, translatedText.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Translation &&
          other.id == this.id &&
          other.initialText == this.initialText &&
          other.translatedText == this.translatedText);
}

class TranslationsCompanion extends UpdateCompanion<Translation> {
  final Value<int> id;
  final Value<String> initialText;
  final Value<String> translatedText;
  const TranslationsCompanion({
    this.id = const Value.absent(),
    this.initialText = const Value.absent(),
    this.translatedText = const Value.absent(),
  });
  TranslationsCompanion.insert({
    this.id = const Value.absent(),
    required String initialText,
    required String translatedText,
  })   : initialText = Value(initialText),
        translatedText = Value(translatedText);
  static Insertable<Translation> custom({
    Expression<int>? id,
    Expression<String>? initialText,
    Expression<String>? translatedText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (initialText != null) 'initial_text': initialText,
      if (translatedText != null) 'translated_text': translatedText,
    });
  }

  TranslationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? initialText,
      Value<String>? translatedText}) {
    return TranslationsCompanion(
      id: id ?? this.id,
      initialText: initialText ?? this.initialText,
      translatedText: translatedText ?? this.translatedText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (initialText.present) {
      map['initial_text'] = Variable<String>(initialText.value);
    }
    if (translatedText.present) {
      map['translated_text'] = Variable<String>(translatedText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TranslationsCompanion(')
          ..write('id: $id, ')
          ..write('initialText: $initialText, ')
          ..write('translatedText: $translatedText')
          ..write(')'))
        .toString();
  }
}

class $TranslationsTable extends Translations
    with TableInfo<$TranslationsTable, Translation> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TranslationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _initialTextMeta =
      const VerificationMeta('initialText');
  @override
  late final GeneratedTextColumn initialText = _constructInitialText();
  GeneratedTextColumn _constructInitialText() {
    return GeneratedTextColumn(
      'initial_text',
      $tableName,
      false,
    );
  }

  final VerificationMeta _translatedTextMeta =
      const VerificationMeta('translatedText');
  @override
  late final GeneratedTextColumn translatedText = _constructTranslatedText();
  GeneratedTextColumn _constructTranslatedText() {
    return GeneratedTextColumn(
      'translated_text',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, initialText, translatedText];
  @override
  $TranslationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'translations';
  @override
  final String actualTableName = 'translations';
  @override
  VerificationContext validateIntegrity(Insertable<Translation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('initial_text')) {
      context.handle(
          _initialTextMeta,
          initialText.isAcceptableOrUnknown(
              data['initial_text']!, _initialTextMeta));
    } else if (isInserting) {
      context.missing(_initialTextMeta);
    }
    if (data.containsKey('translated_text')) {
      context.handle(
          _translatedTextMeta,
          translatedText.isAcceptableOrUnknown(
              data['translated_text']!, _translatedTextMeta));
    } else if (isInserting) {
      context.missing(_translatedTextMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Translation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Translation.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TranslationsTable createAlias(String alias) {
    return $TranslationsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TranslationsTable translations = $TranslationsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [translations];
}
