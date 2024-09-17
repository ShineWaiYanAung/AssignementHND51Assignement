
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'config/ theme/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'features/auth/presenation/Domain/UserAccount/lecture.dart';
import 'features/auth/presenation/Domain/UserAccount/userAccountModel.dart';
import 'features/auth/presenation/HiveDataBase/account_regiersterion.dart';
import 'features/auth/presenation/pages/login.dart';
import 'features/school_activities/presentation/bloc/cours_bloc.dart';
Future<void>main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAccountModelAdapter());
  Hive.registerAdapter(AccountRegiersterionAdapter());
  Hive.registerAdapter(LectureAdapter());
  await Hive.openBox<AccountRegiersterion>('userAccount');
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>CourseBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor:  primaryColor,
          focusColor: focusColor,
          scaffoldBackgroundColor: lightModeBackGroundColor,
          cardColor: boxColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: primaryTextColor),   // Primary text color
            bodyMedium: TextStyle(color: labelMediumTextColor),
            bodySmall: TextStyle(color: iconTextColor),// Seconda// Secondary text color

           ),
          useMaterial3: true,
        ),
        home: Login()
      ),
    );
  }
}
