import 'package:flutter/material.dart';
import 'package:myproject/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:myproject/providers/transaction_provider.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider2();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: ""),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
