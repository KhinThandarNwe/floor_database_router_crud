import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/shared/core_provider.dart';
import '../infrastructure/service/dao/item_dao.dart';
import '../infrastructure/service/item_local_service.dart';

final itemDaoProvider = Provider<ItemDao>((ref) {
  return ref.watch(appFloorDBProvider).instance.itemDao;
});

final itemLocalServiceProvider = Provider<ItemLocalService>((ref) {
  return ItemLocalService(ref.watch(itemDaoProvider));
});
