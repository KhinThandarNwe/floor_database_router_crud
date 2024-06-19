import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../infastructure/app_database.dart';

final appFloorDBProvider = Provider(
  (ref) => AppFloorDB(),
);
