import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_task2/pages/create_page.dart';
import 'package:hive_task2/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox("pdp_online");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        CreateAccount.id: (context) => CreateAccount(),
      },
    );
  }
}
