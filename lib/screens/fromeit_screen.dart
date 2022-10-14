import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

import '../models/Transaction.dart';

class FormEditScreen extends StatefulWidget {
  final Transactions data;

  //Controller

  const FormEditScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<FormEditScreen> createState() => _FormEditScreenState();
}

class _FormEditScreenState extends State<FormEditScreen> {
  final formKey = GlobalKey<FormState>();

  final contentController = TextEditingController();
  final titleController = TextEditingController();
  final typeController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    titleController.text = widget.data.title.toString();
    contentController.text = widget.data.content.toString();
    typeController.text = widget.data.content.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 207, 104),
          title: const Text('แบบฟอร์มแก้ไขข้อมูล'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "ชื่ออาหาร"),
                      autofocus: false,
                      controller: titleController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดใส่ชื่ออาหาร.";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 15,
                      minLines: 3,
                      decoration: const InputDecoration(labelText: "สูตรอาหาร"),
                      autofocus: false,
                      controller: contentController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดใส่สูตรอาหาร";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "ความยาก"),
                      autofocus: false,
                      controller: typeController,
                      validator: (String? str) {
                        if (str!.isEmpty) {
                          return "โปรดใส่ข้อมูล.";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        style: style,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var title = titleController.text;
                            var content = contentController.text;
                            var type = typeController.text;

                            var provider = Provider.of<TransactionProvider>(
                                context,
                                listen: false);
                            Transactions item = Transactions(
                                title: title, content: content, tpye: type);
                            provider.updateTransaction(item);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Save data"))
                  ]),
            )));
  }
}
