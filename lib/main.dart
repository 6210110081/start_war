import 'package:flutter/material.dart';
import 'package:star_war/starwars_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('STAR WAR'),
        ),
        body: StarwarsList(),
      ),
    );
  }
}
