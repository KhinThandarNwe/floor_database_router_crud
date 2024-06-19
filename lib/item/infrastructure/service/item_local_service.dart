import '../model/item_dto.dart';
import 'dao/item_dao.dart';

class ItemLocalService {
  final ItemDao _dao;

  ItemLocalService(this._dao);

  Future<List<ItemDto>> findAllTodoitem() async {
    return await _dao.findAllTodo();
  }

  Future<ItemDto?> getMaxId() async {
    return await _dao.getMaxId();
  }

  Stream<List<ItemDto>> streamedDataitem() {
    return _dao.streamedData();
  }

  Future<void> addTodoitem(ItemDto itemDto) async {
    return await _dao.insertTodo(itemDto);
  }

  Future<void> updateTodoitem(ItemDto itemDto) async {
    return await _dao.updateTodo(itemDto);
  }

  Future<void> deleteTodo(String id) async {
    return await _dao.deleteTodo(id);
  }

  Future<int> deleteAll(List<ItemDto> list) async {
    return await _dao.deleteAll(list);
  }
}
