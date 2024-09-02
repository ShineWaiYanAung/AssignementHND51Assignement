import 'package:hive/hive.dart';

import 'account_regiersterion.dart';

class Boxes {
  static Box<AccountRegiersterion> getAccountRegiersterion() =>
      Hive.box<AccountRegiersterion>('userAccount');
}
