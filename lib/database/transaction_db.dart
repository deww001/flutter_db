import 'dart:io';
import 'package:myproject/models/Transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  String dbName;

  TransactionDB({required this.dbName});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> InsertData(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "content": statement.content,
      "type": statement.tpye
    });
    db.close();
    return keyID;
  }

  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<Transactions> transactionList = [];
    for (var record in snapshot) {
      int id = record.key;
      String title = record['title'].toString();
      String content = record['content'].toString();
      String type = record['type'].toString();
      transactionList.add(Transactions(
        title: title,
        content: content,
        tpye: type,
      ));
    }
    return transactionList;
  }

  Future updateData(Transactions statement) async {
    //create db client obj
    var db = await openDatabase();

    //create store
    var store = intMapStoreFactory.store("expense");

    //filter with 'id'
    final finder = Finder(
        filter: Filter.and(<Filter>[Filter.equals('title', statement.title)]));
    var updateResult =
        await store.update(db, statement.toMap(), finder: finder);

    db.close();
  }

  Future deleteData(Transactions statement) async {
    //create db client obj
    var db = await openDatabase();

    //create store
    var store = intMapStoreFactory.store("expense");

    //filter with 'id'
    final finder = Finder(filter: Filter.equals('title', statement.title));

    var deleteResult = await store.delete(db, finder: finder);

    db.close();
  }

  Future<Transactions?> loadSingleRow(int rowId) async {
    //create db client obj
    var db = await openDatabase();

    //create store
    var store = intMapStoreFactory.store("expense");

    //Filter store by field 'id'
    var snapshot =
        await store.find(db, finder: Finder(filter: Filter.byKey(rowId)));

    Transactions? transaction;

    int id = int.parse(snapshot.first['id'].toString());
    String title = snapshot.first['title'].toString();
    String content = snapshot.first['content'].toString();
    String type = snapshot.first['type'].toString();

    transaction = Transactions(title: title, content: content, tpye: type);

    db.close();
    return transaction;
  }
}
