import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/transaction.dart';
import 'package:flutter_application_1/provider/transactionProvider.dart';
import 'package:provider/provider.dart';
import 'formScreen.dart';
import 'package:intl/intl.dart'; // ใช้จัดรูปแบบวันที่

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const formScreen()),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          if (provider.transactions.isEmpty) {
            return const Center(
              child: Text(
                'ไม่มีข้อมูลการทำธุรกรรม',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, index) {
              Transaction data = provider.transactions[index];
              String formattedDate =
                  DateFormat('dd/MM/yyyy HH:mm').format(data.date);

              return Card(
                elevation: 3,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(data.title),
                  subtitle: Text('วันที่: $formattedDate'),
                  leading: CircleAvatar(
                    child: FittedBox(
                      child: Text(data.amont.toString()),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
