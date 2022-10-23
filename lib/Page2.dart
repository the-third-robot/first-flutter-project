import 'package:first_project/toDoList.dart';
import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
        appBar: AppBar(title:   const Text('Navigation Sample')),
        body: Center(
          child: Column(
            children:  [
              Text('This is Page 2'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);},
                child: const Text('Go Back'),)
            ],),
          ),
        ),
    );
  }
}
