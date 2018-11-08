import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

       List currencies;

       List<MaterialColor> _colors = [ Colors.blue ,  Colors.indigo, Colors.red];

      @override
      void initState() {
        currencies =  getCurrencies();
      }

      @override
      Widget build(BuildContext context) {
        return Container(
           child: Scaffold(
             appBar: AppBar(
               title: Text("Crypto Watch"),
             ),
             body: Material(),
           ),
        );
      }
    
      Widget CryptoWidget(){
        return Container(
          child: Flexible(
            child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (BuildContext context , int index){
                final Map currency = currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return getListItemUi(currency,color);
              },
            ),
          ),
        );
      }
    
      Future<List> getCurrencies() async {
        String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
        http.Response response = await http.get(url);
        return json.decode(response.body);
      }

      ListTile getListItemUi(Map currency, MaterialColor color)
      {
        return ListTile(leading: CircleAvatar(backgroundColor: color,
        child: Text(currency['name'][0]),),
        title: Text(currency['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),)
                    subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']
                    ),);
      }

    Widget _getSubtitleText(String priceUSD, String percentageChange){
      TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD\n",
      style: TextStyle(color: Colors.black));

      String
    }
}