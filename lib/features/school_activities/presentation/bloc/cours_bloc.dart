import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/Domain/UserAccount/lecture.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/Domain/UserAccount/userAccountModel.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/HiveDataBase/account_regiersterion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presenation/HiveDataBase/boxes.dart';
import '../../data/models/models.dart';
import 'coure_state.dart';
import 'course_evet.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial());

  Future<void> addAccountRegiseristion(
      List<UserAccountModel> userAccount, List<Lecture> lectures) async {
    final transaction = AccountRegiersterion()
      ..userAccount = userAccount
      ..createdDate = DateTime.now()
      ..courses = lectures;

    // Print the details of the transaction for debugging
    print("Transaction Details:");
    print("Created Date: ${transaction.createdDate}");
    print("User Accounts:");
    for (var account in transaction.userAccount) {
      print(" - UserName: ${account.userName}, Email: ${account.email}, Gender: ${account.gender}, Age: ${account.age}");
    }
    print("Lectures:");
    for (var lecture in transaction.courses) {
      print(" - ${lecture.name}");
    }

    final box = Boxes.getAccountRegiersterion();
    box.add(transaction);

    print("Transaction added to the box.");
  }


  void deleteAccount (account) {
    account.delete();
  }
}
