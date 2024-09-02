
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/pages/user_accouts_display.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/auth/presenation/widget/componets/widget_small_textfield.dart';
import 'package:assignment_hnd51_shinewaiyanaung/features/school_activities/presentation/bloc/cours_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Domain/UserAccount/lecture.dart';
import '../Domain/UserAccount/userAccountModel.dart';
import '../widget/componets/widget_textfield.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  List<Lecture> selectedLectures = [];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      "AppImages/UniversityIcon/GUSGO.png",
                      height: 50,
                    ),
                    const Text(
                      "GUSGO",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: "PrimaryFont",
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              alignment: Alignment.center,
              child: const Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "PrimaryFont",
                  letterSpacing: 3,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                padding: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("AppImages/SignBackGround/SignBackGround.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    Center(
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          TextFieldBox(
                            width: width,
                            hintText: 'UserName',
                            controller: userNameController,
                          ),
                          const SizedBox(height: 30),

                          TextFieldBox(
                            width: width,
                            hintText: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(height: 30),
                          TextFieldBox(
                            width: width,
                            hintText: 'Password',
                            controller: passwordController,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: ()=>showLectureDialog(context),
                            child: Container(

                                width: 0.35 *width,
                                padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 20),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black45,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(1, 2)
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  const Text("Lectures",style: TextStyle(
                                    color: Color(0xFf2D3E6A),
                                    fontFamily: 'SecondaryFont',
                                    fontSize: 15
                                ),)
                            ),
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              WidgetSmallTextfield(hintText: "Gender", controller: genderController, width: width, keyboardType: TextInputType.text,),
                              SizedBox(width: 15,),
                              WidgetSmallTextfield(hintText: "Age", controller: ageController, width: width,keyboardType: TextInputType.number)
                            ],
                          ),
                          const SizedBox(height: 40),


                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
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
                              onPressed: (){
                                userAccountRegiestor();
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SecondaryFont',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {

                              final route = MaterialPageRoute(builder: (context) =>Login());
                              Navigator.of(context).push(route);
                            },
                            child: const Text(
                              "Already Have An Account ?",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'SecondaryFont',
                                color: Color(0xFF2D3E6A),
                              ),
                            ),
                          ),
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

  void userAccountRegiestor (){
    List <UserAccountModel> userAccounts =[];
   final String userName = userNameController.text;
   final String email   = emailController.text;
   final String password = passwordController.text;
   final String gender = genderController.text;
   final int?  age =  int.tryParse(ageController.text);

   if(userName.isNotEmpty && email.isNotEmpty && gender.isNotEmpty && password.isNotEmpty && age !=null && selectedLectures.isNotEmpty){
     final userAccount = UserAccountModel(
       userName :userName,
       email : email,
       password: password,
       gender :gender,
       age : age,
     );
     setState(() {
       userAccounts = [userAccount];
     });
     final coureBloc = context.read<CourseBloc>();

     coureBloc.addAccountRegiseristion( userAccounts, selectedLectures);
     UserAccountModel.handleErrorState(context, "Created Successfully Welcome ${userAccount.userName}",
         true);
     userNameController.clear();
     emailController.clear();
     passwordController.clear();
     genderController.clear();
     ageController.clear();

     setState(() {
       selectedLectures.clear();
     });

   }
   else{
     UserAccountModel.handleErrorState(context, "Pleas Fill in all field Correctly",
         false);
   }

  }
  void showLectureDialog(BuildContext context) {
    final List<Lecture> allLectures = [
      Lecture(name: "HND 51_Unit 20:APDP"),
      Lecture(name: "HND 51_Unit 45:IoT"),
      Lecture(name: "HND 51_Unit 17:BPS"),
      Lecture(name: "HND 51_Unit 16:CRP")
    ];

    Set<Lecture> tempSelectedLectures = Set.from(selectedLectures);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text(
                "GUSGO Lecture",
                style: TextStyle(
                  color: Color(0xFF2D3E6A),
                  fontFamily: 'SecondaryFont',
                  fontSize: 18,
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: allLectures.map((lecture) {
                    return CheckboxListTile(
                      value: tempSelectedLectures.contains(lecture),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            tempSelectedLectures.add(lecture);
                          } else {
                            tempSelectedLectures.remove(lecture);
                          }
                        });
                      },
                      title: Text(
                        lecture.name,
                        style: const TextStyle(
                          color: Color(0xFF2D3E6A),
                          fontFamily: 'SecondaryFont',
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xFF2D3E6A),
                      fontFamily: 'SecondaryFont',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      selectedLectures = tempSelectedLectures.toList();
                    });
                    // Print the selected lectures for verification
                    print("Selected Lectures: ${selectedLectures.map((l) => l.name).toList()}");
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Color(0xFF2D3E6A),
                      fontFamily: 'SecondaryFont',
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }



}
