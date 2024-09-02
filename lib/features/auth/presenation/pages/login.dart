import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/Domain/UserAccount/userAccountModel.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/sign_up.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/user_accouts_display.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/mainControlScreen.dart';
import 'package:flutter/material.dart';

import '../HiveDataBase/boxes.dart';
import '../widget/componets/widget_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      UserAccountModel.handleErrorState(
          context, "Please Fill the Necessary Requirement ", false);
      return;
    }

    final box = Boxes.getAccountRegiersterion();
    bool found = false;

    for (var transaction in box.values) {
      for (var account in transaction.userAccount) {
        if (account.email == email && account.password == password) {
          setState(() {
            found = true;
          });
          break;
        }
      }
      if (found) break;
    }

    if (found) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MainControlScreen())); // Replace with your actual route
    } else {
      UserAccountModel.handleErrorState(
          context, "Your Name or Password is InCorrect ", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: 0.4 * height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "AppImages/UniversityIcon/GUSGO.png",
                    height: 120,
                  ),
                  const Text(
                    "GUSGO",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: "PrimaryFont",
                        letterSpacing: 2),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    topLeft: Radius.circular(80),
                  ),
                ),
                child: ListView(
                  // Wrap the ListView with a Center widget
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Are you a new member ?",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'SecondaryFont',
                              color: Color(0xFF2D3E6A),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              final route = MaterialPageRoute(
                                  builder: (context) => SignUp());
                              Navigator.of(context).push(route);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SecondaryFont',
                                color: Color(0xFF2D3E6A),
                              ),
                            ),
                          ),
                          TextFieldBox(
                              width: width,
                              hintText: 'Email',
                              controller: emailController),
                          SizedBox(
                            height: 30,
                          ),
                          TextFieldBox(
                              width: width,
                              hintText: 'Password',
                              controller: passwordController),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              final route = MaterialPageRoute(
                                  builder: (context) => UserAccountsDisplay());
                              Navigator.of(context).push(route);
                            },
                            child: const Text(
                              "Have Created Account ?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SecondaryFont',
                                color: Color(0xFF2D3E6A),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){
                              _login();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Color(0xFF2D3E6A),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black45,
                                        blurRadius: 2,
                                        spreadRadius: 1)
                                  ]),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'SecondaryFont',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
