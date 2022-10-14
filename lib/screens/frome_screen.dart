import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:myproject/providers/transaction_provider.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';

class FromeScreen extends StatefulWidget {
  const FromeScreen({Key? key}) : super(key: key);
  @override
  State<FromeScreen> createState() => _FromeScreen();
}

class _FromeScreen extends State<FromeScreen> {
  final fromKey = GlobalKey<FormState>();
  final titleController_1 = TextEditingController();
  final contentController = TextEditingController();
  final typeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 207, 104),
        title: Text("เพิ่มสูตรอาหาร"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/image1.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      decoration: new InputDecoration(labelText: "ชื่ออาหาร"),
                      autofocus: true,
                      controller: titleController_1,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดป้อนชื่ออาหาร";
                        }
                        return null;
                      }),
                  TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      decoration:
                          new InputDecoration(labelText: "ใส่สูตรอาหาร"),
                      autofocus: true,
                      controller: contentController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดป้อนสูตร";
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: new InputDecoration(labelText: "ความยาก"),
                      autofocus: true,
                      controller: typeController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดป้อนข้อมูล";
                        }
                        return null;
                      }),
                  ElevatedButton(
                    child: Text(
                      "เพิ่มสูตรอาหาร",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        var title = titleController_1.text;
                        var content = contentController.text;
                        var type = typeController.text;
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);
                        Transactions item = Transactions(
                            title: title, content: content, tpye: type);

                        provider.addTransaction(item);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
