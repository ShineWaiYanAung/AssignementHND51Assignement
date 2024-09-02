import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/Domain/UserAccount/lecture.dart';
import 'package:hive/hive.dart';
import '../Domain/UserAccount/userAccountModel.dart';
part 'account_regiersterion.g.dart';
@HiveType(typeId: 9)
class AccountRegiersterion extends HiveObject{
  @HiveField(10)
  late DateTime createdDate;

  @HiveField(11)
  late List<UserAccountModel> userAccount;

  @HiveField(13)
  late List<Lecture> courses;
}