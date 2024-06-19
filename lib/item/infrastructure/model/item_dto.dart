import 'package:floor/floor.dart';

@Entity(tableName: 'items')
class ItemDto {
  @primaryKey
  final String id;
  final String task;
  // final String time;
//  final String schecdulaTime;
  final String active;
  final String createdBy;
  final String createdOn;
  final String modifiedBy;
  final String modifiedOn;

  ItemDto(
      {required this.id,
      required this.task,
      //  required this.time,
      //  required this.schecdulaTime,
      required this.active,
      required this.createdBy,
      required this.createdOn,
      required this.modifiedBy,
      required this.modifiedOn});
}
