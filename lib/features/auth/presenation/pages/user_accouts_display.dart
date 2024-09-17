import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/HiveDataBase/account_regiersterion.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/sign_up.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/widget/componets/widget_small_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart'; // Make sure this import is present

import '../../../school_activities/presentation/bloc/cours_bloc.dart';
import '../../../school_activities/presentation/page/mainControlScreen.dart';
import '../Domain/UserAccount/lecture.dart';
import '../Domain/UserAccount/userAccountModel.dart';
import '../HiveDataBase/boxes.dart';

class UserAccountsDisplay extends StatefulWidget {
  const UserAccountsDisplay({super.key});

  @override
  State<UserAccountsDisplay> createState() => _UserAccountsDisplayState();
}

class _UserAccountsDisplayState extends State<UserAccountsDisplay> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    Future<void> _enter() async {
      final password = passwordController.text;
      UserAccountModel? userAccount; // Declare as nullable
      List<Lecture>? userCourses;
      if ( password.isEmpty) {
        UserAccountModel.handleErrorState(
            context, "Please Fill the Necessary Requirement ", false);
        return;
      }

      final box = Boxes.getAccountRegiersterion();
      bool found = false;

      for (var transaction in box.values) {
        for (var account in transaction.userAccount) {
          if (account.password == password) {
            userAccount = UserAccountModel(
                userName: account.userName,
                password: account.password,
                email: account.email,
                gender: account.gender,
                age: account.age
            );
            userCourses = transaction.courses;
            setState(() {
              found = true;
            });
            break;
          }
        }
        if (found) break;
      }

      if (found && userAccount != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainControlScreen(
              userAccount: userAccount!, courses: userCourses!,
            ),
          ),

        );
        UserAccountModel.handleErrorState(
            context, "WellCome Back ${userAccount.userName}",true);
      } else {
        UserAccountModel.handleErrorState(
            context, "Password is Incorrect ", false);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("AppImages/BackIcon/backButton.png")),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your Accounts",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: "PrimaryFont",
                  letterSpacing: 3,
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<Box<AccountRegiersterion>>(
                valueListenable: Boxes.getAccountRegiersterion().listenable(),
                builder: (context, box, _) {
                  final accounts =
                      box.values.toList().cast<AccountRegiersterion>();
                  if (accounts.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Accounts",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        final account = accounts[index];
                        // Extract the user account from the transaction
                        final userAccount = account.userAccount.isNotEmpty
                            ? account.userAccount[0]
                            : null;
                        return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFCFDAF9),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 1,
                                    blurRadius: 1)
                              ],
                            ),
                            child: ExpansionTile(
                              backgroundColor: Colors.white,
                              title: userAccount != null
                                  ? Text(
                                      userAccount.userName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF233052),
                                      ),
                                    )
                                  : const Text('No UserName'),
                              subtitle: userAccount != null
                                  ? Text(
                                      userAccount.email,
                                      style: const TextStyle(
                                        color: Color(0xFF233052),
                                      ),
                                    )
                                  : const Text('No Email'),
                              trailing: IconButton(
                                onPressed: () {
                                  final accountBloc =
                                      context.read<CourseBloc>();
                                  accountBloc.deleteAccount(account);
                                },
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black45,
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(1, 2),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TextField(
                                            controller: passwordController,
                                            keyboardType: TextInputType
                                                .text, // Change this to TextInputType.text if it's a password
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                color: Color(0xFF2D3E6A),
                                                fontFamily: 'SecondaryFont',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              60), // Add some space between the TextField and TextButton
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFF2D3E6A),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black45,
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            _enter();
                                          },
                                          child: const Text(
                                            'Enter',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'SecondaryFont',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                          width: 20), // Add some space
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
