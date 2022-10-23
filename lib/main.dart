import 'package:first_project/Page2.dart';
import 'package:first_project/home_page.dart';
import 'package:first_project/toDoList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/todo_list/' : (context){
          return const ToDoList();
        },
        '/home_page/' : (context){
          return const HomePage();
        },
        '/page2/' : (context){
          return const Page2();
        }
      },
    );
  }

}


