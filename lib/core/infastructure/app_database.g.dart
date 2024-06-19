// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ItemDao? _itemDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `items` (`id` TEXT NOT NULL, `task` TEXT NOT NULL, `active` TEXT NOT NULL, `createdBy` TEXT NOT NULL, `createdOn` TEXT NOT NULL, `modifiedBy` TEXT NOT NULL, `modifiedOn` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ItemDao get itemDao {
    return _itemDaoInstance ??= _$ItemDao(database, changeListener);
  }
}

class _$ItemDao extends ItemDao {
  _$ItemDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _itemDtoInsertionAdapter = InsertionAdapter(
            database,
            'items',
            (ItemDto item) => <String, Object?>{
                  'id': item.id,
                  'task': item.task,
                  'active': item.active,
                  'createdBy': item.createdBy,
                  'createdOn': item.createdOn,
                  'modifiedBy': item.modifiedBy,
                  'modifiedOn': item.modifiedOn
                },
            changeListener),
        _itemDtoUpdateAdapter = UpdateAdapter(
            database,
            'items',
            ['id'],
            (ItemDto item) => <String, Object?>{
                  'id': item.id,
                  'task': item.task,
                  'active': item.active,
                  'createdBy': item.createdBy,
                  'createdOn': item.createdOn,
                  'modifiedBy': item.modifiedBy,
                  'modifiedOn': item.modifiedOn
                },
            changeListener),
        _itemDtoDeletionAdapter = DeletionAdapter(
            database,
            'items',
            ['id'],
            (ItemDto item) => <String, Object?>{
                  'id': item.id,
                  'task': item.task,
                  'active': item.active,
                  'createdBy': item.createdBy,
                  'createdOn': item.createdOn,
                  'modifiedBy': item.modifiedBy,
                  'modifiedOn': item.modifiedOn
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ItemDto> _itemDtoInsertionAdapter;

  final UpdateAdapter<ItemDto> _itemDtoUpdateAdapter;

  final DeletionAdapter<ItemDto> _itemDtoDeletionAdapter;

  @override
  Future<List<ItemDto>> findAllTodo() async {
    return _queryAdapter.queryList('select * from items',
        mapper: (Map<String, Object?> row) => ItemDto(
            id: row['id'] as String,
            task: row['task'] as String,
            active: row['active'] as String,
            createdBy: row['createdBy'] as String,
            createdOn: row['createdOn'] as String,
            modifiedBy: row['modifiedBy'] as String,
            modifiedOn: row['modifiedOn'] as String));
  }

  @override
  Future<ItemDto?> getMaxId() async {
    return _queryAdapter.query('select * from items order by id desc limit 1',
        mapper: (Map<String, Object?> row) => ItemDto(
            id: row['id'] as String,
            task: row['task'] as String,
            active: row['active'] as String,
            createdBy: row['createdBy'] as String,
            createdOn: row['createdOn'] as String,
            modifiedBy: row['modifiedBy'] as String,
            modifiedOn: row['modifiedOn'] as String));
  }

  @override
  Stream<List<ItemDto>> streamedData() {
    return _queryAdapter.queryListStream('select * from items order by id desc',
        mapper: (Map<String, Object?> row) => ItemDto(
            id: row['id'] as String,
            task: row['task'] as String,
            active: row['active'] as String,
            createdBy: row['createdBy'] as String,
            createdOn: row['createdOn'] as String,
            modifiedBy: row['modifiedBy'] as String,
            modifiedOn: row['modifiedOn'] as String),
        queryableName: 'items',
        isView: false);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await _queryAdapter
        .queryNoReturn('delete from items where id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertTodo(ItemDto itemDto) async {
    await _itemDtoInsertionAdapter.insert(itemDto, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTodo(ItemDto itemDto) async {
    await _itemDtoUpdateAdapter.update(itemDto, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteAll(List<ItemDto> list) {
    return _itemDtoDeletionAdapter.deleteListAndReturnChangedRows(list);
  }
}
