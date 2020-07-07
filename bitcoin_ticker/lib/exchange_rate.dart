import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExchangeRate {

  String url = 'https://rest.coinapi.io/v1/exchangerate';
  String apiKey = '431C17C5-ADED-4A97-8643-6BF429C8D509';

  Future<dynamic> getExchangeRate({@required String crypto, @required String currency}) async {
    http.Response response = await http.get('$url/$crypto/$currency', headers: {'X-CoinAPI-Key' : apiKey});
    var data = jsonDecode(response.body);
    return (data);
  }

}