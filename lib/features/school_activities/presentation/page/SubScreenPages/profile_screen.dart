import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/login.dart';
import 'package:flutter/material.dart';

import '../../../../auth/presenation/Domain/UserAccount/userAccountModel.dart';
import '../../widget/Components/main_title.dart';
import '../../widget/Components/up_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
 final bool isShowUpBar;
final  UserAccountModel userAccount;
  const ProfileScreen({
    required this.userAccount,
    super.key, required this.isShowUpBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
          isShowUpBar ?  UpBarWidget(changesControl: false): SizedBox(),
            ///FirstTitle
            CircleAvatar(
              radius: 80,
              child: Image.asset("AppImages/PersonIcon/maleStudent.png"),
            ),
        SizedBox(
          height: 50,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 60),
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(50)
          ),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               profielInfo("Name" , userAccount.userName),
              profielInfo("Age" , userAccount.age.toString()),
              profielInfo("Gender" , userAccount.gender),
              profielInfo("Mail" , userAccount.email),
              profielInfo("Password", userAccount.password),
              profielInfo("Batch" , "HND-51"),

            ],
          ),
        ),

            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
                width: 200,
                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
                      // Add logout functionality here
                    },
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontFamily: "PrimaryFont",
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  Widget profielInfo(String title, String data) {
    return Row(

               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(

                   child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "PrimaryFont"),),
                 ),
                 SizedBox(
                   child: Text(data,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "SecondaryFont"),),
                 ),
               ],
             );
  }
}
