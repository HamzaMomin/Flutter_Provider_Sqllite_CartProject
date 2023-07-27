import 'package:flutter/material.dart';
import 'package:flutter_application_provider_sql/provider/count_provider.dart';
import 'package:flutter_application_provider_sql/screen/count_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const CountExample()
    ),
      );
  
      } 
     
  }

