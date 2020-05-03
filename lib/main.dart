import 'package:flutter/material.dart';
import 'package:livecode_crud/views/criar_page.dart';
import 'package:livecode_crud/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        CriarPage.tag: (context) => CriarPage(),
      },
    );
  }
}
