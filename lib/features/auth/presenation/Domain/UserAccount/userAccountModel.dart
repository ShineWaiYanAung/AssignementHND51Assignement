import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'userAccountModel.g.dart';

@HiveType(typeId: 1)
class UserAccountModel {
  @HiveField(0)
  final String userName;
  @HiveField(1)
  final String password;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final int? age;
  UserAccountModel({
    required this.userName,
    required this.password,
    required this.email,
    required this.gender,
    required this.age,
  });
  static void handleErrorState(
      BuildContext context, String message, bool errorState) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: errorState ? Colors.green : Colors.red,
        content: Text("$message"),
      ),
    );
  }
}
