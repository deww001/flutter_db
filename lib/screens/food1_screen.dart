import 'package:flutter/material.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:myproject/providers/transaction_provider.dart';
import 'package:myproject/screens/frome_screen.dart';
import 'package:myproject/screens/fromeit_screen.dart';
import 'package:provider/provider.dart';

class food_cow extends StatefulWidget {
  const food_cow({Key? key}) : super(key: key);

  @override
  State<food_cow> createState() => _food_cowState();
}

class _food_cowState extends State<food_cow> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(250, 230, 109, 109),
        appBar: AppBar(
          title: Text("สูตรอาหารของคุณ"),
          backgroundColor: Color.fromARGB(255, 255, 207, 104),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FromeScreen();
                  }));
                },
                icon: Icon(Icons.add_box_sharp))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image3.jpg"),
            fit: BoxFit.cover,
          )),
          child:
              Consumer(builder: (context, TransactionProvider provider, child) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return const Center(child: Text("ไม่มีข้อมูล"));
            } else {
              return ListView.builder(
                  itemCount:
                      provider.transactions.length, //ใช้อ้างอิงไปที่ provider
                  itemBuilder: (BuildContext context, int index) {
                    Transactions data =
                        provider.transactions[index]; //ใช้เเสดงผลข้อมูลที่ละตัว
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Card(
                        elevation: 5,
                        margin: EdgeInsets.all(6),
                        child: ListTile(
                            title: Text(data.title),
                            subtitle: Text(data.content),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return FormEditScreen(data: data);
                              }));
                            },
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                var provider = Provider.of<TransactionProvider>(
                                    context,
                                    listen: false);
                                provider.deleteTransaction(data);
                              },
                            )),
                      ),
                    );
                  });
            }
          }),
        ));
  }
}
