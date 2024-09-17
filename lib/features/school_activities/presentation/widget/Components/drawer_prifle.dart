import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/Domain/UserAccount/userAccountModel.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/login.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/about_app.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/page/SubScreenPages/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final UserAccountModel accountModel;
  CustomDrawer({required this.accountModel});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Container
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Image.asset("AppImages/PersonIcon/maleStudent.png"),
                ),
                SizedBox(width: 20),
                Text(
                  accountModel.userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),

          // Card for Profile
          Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      userAccount: accountModel,
                      isShowUpBar: true,
                    ),
                  ),
                );
                // Navigate to profile screen
              },
            ),
          ),
          SizedBox(height: 20),
          // Card for About App
          Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About App', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AboutApp(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

          // Card for Grading
          Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.grade, color: Colors.white),
              title: Text('Grading', style: TextStyle(color: Colors.white)),
              onTap: () {

              },
            ),
          ),

          Spacer(), // Push the logout button to the bottom

          // Logout Button
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Handle logout functionality
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
              // Implement logout logic here
            },
          ),
        ],
      ),
    );
  }
}
