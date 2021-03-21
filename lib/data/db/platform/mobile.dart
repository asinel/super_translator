import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;
import 'package:super_translator/data/db/db.dart';

import '../db.dart';

MyDatabase constructDb({bool logStatements = false}) {
  final executor = LazyDatabase(() async {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
    return VmDatabase(dbFile, logStatements: logStatements);
  });
  return MyDatabase(executor);
}