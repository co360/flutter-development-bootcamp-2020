import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/exchange_rate.dart';
import 'package:bitcoin_ticker/currency_card.dart';

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency = 'USD';
  double price = 0.0;

  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      Widget item = DropdownMenuItem(child: Text(currency), value: currency);
      items.add(item);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCurrencyCards();
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Widget> items = [];
    for (String currency in currenciesList) {
      Widget item = Text(currency, style: TextStyle(color: Colors.white));
      items.add(item);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        setState(() {
          selectedCurrency = currenciesList[selectedItem];
          getCurrencyCards();
        });
      },
      children: items,
    );
  }

  void getRate({String crypto, String currency}) async {
    var coinData = await ExchangeRate().getExchangeRate(crypto: crypto, currency: currency);
    //print(coinData);
    price = coinData['rate'];
  }

  List<Widget> getCurrencyCards() {
    List<Widget> cards = [];
    for (String crypto in cryptoList) {
      getRate(crypto: crypto, currency: selectedCurrency);
      //print(price);
      Widget card = CurrencyCard(price: price, selectedCrypto: crypto, selectedCurrency: selectedCurrency).getCard();
      cards.add(card);
    }
    return cards;
  }


  @override
  Widget build(BuildContext context) {
    //getRate(crypto: 'BTC', currency: selectedCurrency);
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: getCurrencyCards(),
          ),
          //CurrencyCard(btcPrice: btcPrice, selectedCurrency: selectedCurrency),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}



