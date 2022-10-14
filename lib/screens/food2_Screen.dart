import 'package:flutter/material.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:myproject/providers/transaction_provider.dart';
import 'package:myproject/screens/frome_screen.dart';
import 'package:myproject/screens/fromeit_screen.dart';
import 'package:provider/provider.dart';

class food_base extends StatefulWidget {
  const food_base({Key? key}) : super(key: key);
  @override
  State<food_base> createState() => _food_baseState();
}

class _food_baseState extends State<food_base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(241, 0, 0, 0),
        appBar: AppBar(
          title: Text("สูตรอาหารที่เเนะนำ"),
          backgroundColor: Color.fromARGB(255, 240, 191, 54),
        ),
        body:
            Consumer(builder: (context, TransactionProvider2 provider, child) {
          return ListView.builder(
              itemCount:
                  provider.transaction2.length, //ใช้อ้างอิงไปที่ provider
              itemBuilder: (BuildContext context, int index) {
                Transactions data =
                    provider.transaction2[index]; //ใช้เเสดงผลข้อมูลที่ละตัว
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/image3.jpg"),
                    fit: BoxFit.cover,
                  )),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                    elevation: 30,
                    margin: EdgeInsets.all(6),
                    child: ListTile(
                      title: Text(data.title),
                      subtitle: Text(data.content),
                    ),
                  ),
                );
              });
        }));
  }
}
