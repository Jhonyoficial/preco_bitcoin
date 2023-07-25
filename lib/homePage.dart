import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePagState extends StatefulWidget {
  const HomePagState({super.key});

  @override
  State<HomePagState> createState() => __HomePagStateState();
}

class __HomePagStateState extends State<HomePagState> {

  String _cotacaoBitcoin = "0";

  void atualizarCotacao() async {
    var url = 'https://blockchain.info/ticker';

    http.Response response =  await http.get(Uri.parse(url));
    Map<String, dynamic> retornoApi = json.decode(response.body); 

    setState(() {
      _cotacaoBitcoin = retornoApi['BRL']['buy'].toString();  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/bitcoin.png'),

            Padding(padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text("R\$ $_cotacaoBitcoin",
              style: TextStyle(
                fontSize: 40,
              ),
            )),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              onPressed: atualizarCotacao, 
              child: Text('Atualizar',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Arial'
                )
              ))
          ]
        ),
      )
    );
  }
}