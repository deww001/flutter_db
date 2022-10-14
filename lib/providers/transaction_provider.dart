import 'package:flutter/cupertino.dart';
import 'package:myproject/database/transaction_db.dart';
import 'package:myproject/models/Transaction.dart';
import 'package:sembast/sembast.dart';

class TransactionProvider2 with ChangeNotifier {
  List<Transactions> transaction2 = [
    Transactions(
        title: ("	ผัดกะเพราหมูสับ \n "),
        content:
            "วิธีทำ\n  1.หั่นหมูสันคอออกเป็นชิ้นๆ แล้วสับหมูออกให้ละเอียดตามความต้องการ แล้วพักไว้\n 2.โขลกพริกแห้งให้ละเอียด แล้วใส่พริกแดงจินดา และกระเทียมโขลกตามลงไปให้ละเอียด  \n3.ตั้งกระทะให้ร้อน ใส่น้ำมันพืชลงไปพอประมาณ ผัดพริกและกระเทียมให้มีกลิ่นหอม \n4.เมื่อพริกกระเทียมหอมได้ที่แล้ว ใส่หมูสับลงไปผัดให้กระจาย ไม่เกาะกันเป็นก้อน ผัดให้เข้ากับพริกกระเทียม ให้หมูสุกในระดับนึง แล้วปรุงรสด้วย น้ำมันหอย น้ำปลา ซอสปรุงรส และซีอิ๊วดำหวาน น้ำตาล เล็กน้อย เร่งไฟผัดให้เข้ากัน ชิมรสชาติ แล้วใส่ใบกะเพราลงไปผัดให้เข้ากัน ปิดเตา ตักเสิร์ฟ ",
        tpye: "ง่าย"),
    Transactions(
        title: "	ขาหมูพะโล้ \n ",
        content:
            "วิธีทำ \n 1 เผา + ทอด ขาหมู เอาขาหมูไปเผาเพื่อกำจัดขนที่หลงเหลือออก เมื่อดูว่าไม่มีขนเหลือแล้วขูดส่วนที่ไหม้เกรียมออก นำไปล้างให้สะอาด\n 2 ตุ๋นขาหมู ตั้งกระทะบนเตาไฟโดยใช้ไฟอ่อน จากนั้นใส่อบเชยลงไป ตามด้วยโป๊ยกั้ก กระเทียม ข่าแก่ และพริกไทยดำลงไปคั่ว  นำขาหมูที่ทอดแล้วมาใส่หม้อ ใส่เครื่องเทศที่คั่วไว้และรากผักชีตามลงไป \n 3 ลวกคะน้า + จัดเสิร์ฟ ลวกคะน้าในหม้อตุ๋นขาหมู แล้วนำมาหั่นเป็นเครื่องเคียง นำขาหมูขึ้นจากหม้อ เลาะเนื้อออกแล้วเสิร์ฟกับข้าวสวยร้อน ๆ คะน้าลวก ผักกาดดอง พริกขี้หนู กระเทียม ",
        tpye: "ปานกลาง"),
    Transactions(
        title: "	ปลาราดพริก \n ",
        content:
            "วิธีทำ \n 1 นำพริกแดงจินดามาหั่นเตรียมไว้เป็นเส้นยาว นำไปแช่น้ำไว้ สำหรับเตรียมแต่งหน้า ส่วนพริกที่เหลือนำไปปั่นรวม \n 2 นำผักชีมาหั่นเรียมไว้หั่นช่วงต้นผักชีไว้สำหรับตกแต่งหน้า ส่วนรากผักชี นำไปปั่นรวมกับพริกแดงจินดา ปั่นจน ละเอียด จากนั้นเติมกระเทียมตามลงไป ละปั่นให้ละเอียดอีกครั้ง พักไว้ \n 3 นำปลานิลล้างทำความสะอาดให้เรียบร้อย นำทิชชู่ซับน้ำออกให้หมาด จากนั้นบั้งที่ตัวปลาให้เรียบร้อย \n 4 กลับอีกด้าน และใช้เวลาน้อยกว่า เมื่อได้ที่แล้วตักขึ้นมาพักไว้ \n 7 นำน้ำราดพริกสามรส ลงไปราดบนตัวปลาที่ทอดพักไว้ ตกแต่งให้สวยงามด้วยผักชี และพริกชี้ฟ้าซอย เป็นอันเสร็จ",
        tpye: "ยาก"),
    Transactions(
        title: "ปลากะพงนึ่งซีอิ๊ว \n",
        content:
            "วิธีทำ \n 1. ล้างทำความสะอาดปลากะพง ขอดเกล็ดและควักไส้ออก นำไปล้างให้สะอาด จากนั้นบั้งเนื้อปลาทั้งสองด้าน วางลงใน ภาชนะสำหรับนึ่ง เตรียมไว้ \n 2. คนผสมซีอิ๊วขาว น้ำมันงา เหล้าจีน น้ำตาลทรายแดง และน้ำร้อนเข้าด้วยกัน ตักราดลงบนตัวปลา วางเห็ดหอมสด ขิงซอย และพริกชี้ฟ้าแดงด้านบนตัวปลาให้ทั่ว \n 3. นำใส่ลงในชุดนึ่งที่มีน้ำเดือด นึ่งใช้ไฟแรง นานประมาณ 30 นาที ยกออกจากชุดนึ่ง โรยหน้าด้วยต้นหอมซอย และ ผักชี พร้อมเสิร์ฟ",
        tpye: "ยาก"),
    Transactions(
        title: "ข้าวผัด \n",
        content:
            "วิธีทำ \n 1. ทำข้าวผัดหมูโดยตั้งกระทะน้ำมันบนไฟกลาง พอร้อนใส่กระเทียมลงผัด ผัดพอหอมใส่เนื้อหมูจนสุก ใส่คะน้าและมะเขือเทศลงผัด จากนั้นตามด้วยข้าวสวยผัดคลุกเคล้าให้เข้ากัน ปรุงรสด้วยซีอิ๊วขาว น้ำมันหอย ซีอิ๊วดำหวาน และพริกไทยขาว ผัดคลุกเคล้าให้เข้ากัน ปิดไฟ\n พริกไทยขาว ผัดคลุกเคล้าให้เข้ากัน ปิดไฟ",
        tpye: "ง่าย"),
  ];
  List<Transactions> gettransaction() {
    return transaction2;
  }
}

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];
  List<Transactions> gettransaction() {
    return transactions;
  }

  void initData() async {
    var db = TransactionDB(dbName: "transactions.db");
    transactions = await db.loadAllData();
    notifyListeners();
  }

  addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    await db.InsertData(statement);
    transactions = await db.loadAllData();
    //transactions.insert(0, statement);

    notifyListeners();
  }

  void updateTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");

    //save data
    await db.updateData(statement);

    //load data
    transactions = await db.loadAllData();

    //notify consumer
    notifyListeners();
  }

  void deleteTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    //save data
    await db.deleteData(statement);

    //load data
    transactions = await db.loadAllData();

    //notify consumer
    notifyListeners();
  }
}
