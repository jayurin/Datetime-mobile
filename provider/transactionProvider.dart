import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'หนังสือ', amont: 1000, date: DateTime.now()),
    Transaction(title: 'เสื้อยืด', amont: 200, date: DateTime.now()),
    Transaction(title: 'รองเท้า', amont: 1500, date: DateTime.now()),
    Transaction(title: 'กระเป๋า', amont: 1000, date: DateTime.now()),
    Transaction(title: 'KFC', amont: 300, date: DateTime.now()),
    Transaction(title: 'McDonald', amont: 0, date: DateTime.now()),
  ];

  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(String title, double amount) {
    transactions.add(Transaction(
      title: title,
      amont: amount,
      date: DateTime.now(), // เพิ่มวันที่อัตโนมัติ
    ));
    notifyListeners(); // แจ้งให้ UI อัปเดต
  }
}
