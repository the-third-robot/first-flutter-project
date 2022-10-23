import 'package:flutter/material.dart';
import 'Page2.dart';
import 'package:badges/badges.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text('MyApp To - Do'),

        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/page2/');
          }, icon: const Icon(Icons.notifications),),
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed('/home_page/');
          }, child: const Text('Home'))
        ],
      ),
      body: Center(
        child: Column(
          children:  [
            const Text('This is Page 1'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/page2/');
                },
              child: const Text('Goto - Page 2'),)
          ],
        ),
        )
    ));
  }
}
