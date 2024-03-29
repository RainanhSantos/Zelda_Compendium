import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/domain/models/entry_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';
//Anotação da biblioteca floor
@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
  EntryDao get entryDao;
}