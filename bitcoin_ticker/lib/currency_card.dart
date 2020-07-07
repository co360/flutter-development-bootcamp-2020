import 'package:flutter/material.dart';

//class CurrencyCard extends StatelessWidget {
//  const CurrencyCard({
//    Key key,
//    @required this.price,
//    @required this.selectedCrypto,
//    @required this.selectedCurrency,
//  }) : super(key: key);

class CurrencyCard {

  final String selectedCurrency;
  final String selectedCrypto;
  final double price;
  CurrencyCard({@required this.price, @required this.selectedCrypto, @required this.selectedCurrency,});
//  @override
//  Widget build(BuildContext context) {
//    print(selectedCurrency);
//    print(selectedCrypto);
//    print(price);
//    return Padding(
//      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//      child: Card(
//        color: Colors.lightBlueAccent,
//        elevation: 5.0,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(10.0),
//        ),
//        child: Padding(
//          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//          child: Text(
//            '1 $selectedCrypto = ${price} $selectedCurrency',
//            textAlign: TextAlign.center,
//            style: TextStyle(
//              fontSize: 20.0,
//              color: Colors.white,
//            ),
//          ),
//        ),
//      ),
//    );
//  }
  Widget getCard() {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $selectedCrypto = ${price} $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
