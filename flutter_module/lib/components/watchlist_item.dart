import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:fluttermodule/constants.dart';
import 'package:fluttermodule/screens/stock_info_screen.dart';
import 'package:fluttermodule/services/stock_service.dart';

class WatchListItem extends StatelessWidget {
   String symbol;
   double price;

   WatchListItem({
    Key key,
    @required this.symbol,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        StockService stockService = StockService();
        print(symbol);
        var stockData = await stockService.getStockQuoteBySymbol(symbol);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StockInfoScreen(
            stockData: stockData,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 5,
          child: Padding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$symbol',
                  style: kPriceTextStyle,
                ),
                Text(
                  'Price: $price',
                  style: kPriceTextStyle,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ),
      ),
    );
  }
}
