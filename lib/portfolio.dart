import 'dart:async';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/stockProvider.dart';
import 'package:provider/provider.dart';

class Portfolio extends StatefulWidget {
  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  void initState() {
    super.initState();
    print('initState');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer timer = Timer.periodic(const Duration(seconds: 1), (_) {
        Provider.of<StockProvider>(context, listen: false).stockRandomise();
        Provider.of<StockProvider>(context, listen: false).getquantity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Container(
            height: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: kGreenBox,
            ),
            child: Center(
              child: ListTile(
                  leading: Image.asset('assets/images/Ellipse.png'),
                  title: kApple,
                  trailing: Text(
                    Provider.of<StockProvider>(context).stockPrice.toString(),
                    style: const TextStyle(fontSize: 24),
                  )),
            ),
          ),
        ),
        const SizedBox(
          height: 90,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quantity:',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                Provider.of<StockProvider>(context).stockQuantity.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 38,
          // child: Text(
          //   Provider.of<StockProvider>(context).stockQuantity.toString(),
          // ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 32),
              ),
              Text(
                Provider.of<StockProvider>(context).stockTotal.toString(),
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        )
      ],
    );
  }
}
