import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iller_ilceler/il.dart';
import 'package:iller_ilceler/ilce.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  List<Il> iller = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jsonCozumle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("İller ve İlçeler"),
      ),
      body: ListView.builder(
        itemCount: iller.length,
        itemBuilder: _listeOgesiniOlustur,
      ),
    );
  }

  Widget _listeOgesiniOlustur(BuildContext context, int index){
    return Card(
      child: ExpansionTile(
        backgroundColor: Colors.grey[200],
        textColor: Colors.red,
        iconColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(iller[index].isim, style: TextStyle(fontWeight: FontWeight.bold),),
            Text(iller[index].plakaKodu, style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        leading: Icon(Icons.location_city),
        //trailing: Text(iller[index].plakaKodu),
        children: iller[index].ilceler.map((ilce){
          return Card(
            child: ListTile(
              title: Text(ilce.isim),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _jsonCozumle() async{
    String jsonString = await rootBundle.loadString("assets/iller_ilceler.json");
    Map<String, dynamic> illerMap = json.decode(jsonString);

    for(String plakaKodu in illerMap.keys){
      Map<String, dynamic> ilMap = illerMap[plakaKodu];
      String ilIsmi = ilMap["name"];
      Map<String, dynamic> ilcelerMap = ilMap["districts"];

      List<Ilce> tumIlceler = [];

      for(String ilceKodu in ilcelerMap.keys){
        Map<String, dynamic> ilceMap = ilcelerMap[ilceKodu];
        String ilceIsmi = ilceMap["name"];
        Ilce ilce = Ilce(ilceIsmi);
        tumIlceler.add(ilce);
      }

      Il il = Il(ilIsmi, plakaKodu, tumIlceler);
      iller.add(il);
    }
    setState(() {});
  }
}
