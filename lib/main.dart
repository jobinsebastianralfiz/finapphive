import 'package:finapphive/models/user_model.dart';
import 'package:finapphive/screens/add_expense_page.dart';
import 'package:finapphive/screens/add_income.dart';
import 'package:finapphive/screens/home_screen.dart';
import 'package:finapphive/screens/login_page.dart';
import 'package:finapphive/screens/register_page.dart';
import 'package:finapphive/services/auth_service.dart';
import 'package:finapphive/services/fin_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/income_model.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  await AuthService().openBox();
  await FinService().openIncomeBox();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   initialRoute: '/',

      routes: {


        '/':(context)=>LoginScreen(),
        '/register':(context)=>RegisterPage(),
        '/home':(context)=>HomeScreen(),
        '/addincome':(context)=>AddIncomePage(),
        '/addexpense':(context)=>AddExpensePage()


      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}


