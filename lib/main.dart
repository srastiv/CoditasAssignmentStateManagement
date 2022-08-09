import 'package:flutter/material.dart';
import 'package:stock_exchange/portfolio.dart';
import 'constants.dart';
import './models/stockProvider.dart';
import 'package:provider/provider.dart';
import 'portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RocknRollOne',
      ),
      home: ChangeNotifierProvider<StockProvider>(
        create: (context) => StockProvider(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Portfolio',
                style: TextStyle(fontSize: 32),
              ),
              centerTitle: false,
              elevation: 0,
              backgroundColor: kBlueAppBar,
            ),
            body: Portfolio(),
          );
        },
      ),
    );
  }
}
