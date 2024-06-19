import 'dart:async';
import 'package:floor/floor.dart';

// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../item/infrastructure/model/item_dto.dart';
import '../../item/infrastructure/service/dao/item_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  ItemDto,
])
abstract class AppDatabase extends FloorDatabase {
  ItemDao get itemDao;
}

class AppFloorDB {
  static const String tag = 'AppFloorDB';

  late AppDatabase _instance;
  AppDatabase get instance => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;

    _instance =
        await $FloorAppDatabase.databaseBuilder('simple_floor.db').build();
  }
}
