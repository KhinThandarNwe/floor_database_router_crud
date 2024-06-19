import 'package:floor/floor.dart';

import '../../model/item_dto.dart';

@dao
abstract class ItemDao {
  @Query('select * from items')
  Future<List<ItemDto>> findAllTodo();

  @Query('select * from items order by id desc limit 1')
  Future<ItemDto?> getMaxId();

  @Query('select * from items order by id desc')
  Stream<List<ItemDto>> streamedData();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTodo(ItemDto itemDto);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTodo(ItemDto itemDto);

  @Query('delete from items where id = :id')
  Future<void> deleteTodo(String id);

  @delete
  Future<int> deleteAll(List<ItemDto> list);
}
