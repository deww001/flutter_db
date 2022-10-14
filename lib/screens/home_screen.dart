import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myproject/screens/food1_screen.dart';
import 'package:provider/provider.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:myproject/providers/transaction_provider.dart';

import 'food2_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenStat();
}

class _HomeScreenStat extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 207, 104),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 228, 151, 50),
          actions: [
            IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: Icon(Icons.exit_to_app))
          ], //จะให้add ไปหน้าบัญชีผู้ใช้
          title: Text("LOVE LUNCH"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/image6.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Card(
                      color: Color.fromARGB(255, 240, 191, 54),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 30,
                      child: Container(
                        child: Center(
                          child: Text("สูตรอาหารของคุณ",
                              style: new TextStyle(
                                fontSize: 30,
                              )),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const food_cow();
                    })));
                  },
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: Card(
                      color: Color.fromARGB(255, 240, 191, 54),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 30,
                      child: Container(
                        child: Center(
                          child: Text(
                            "สูตรอาหารเเนะนำ",
                            style: new TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const food_base();
                    })));
                  },
                ),
              ],
            )));
  }
}
