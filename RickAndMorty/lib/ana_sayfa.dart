import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/karakter_detay_sayfasi.dart';
import 'package:rickandmorty/ortak_liste.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favoriler.dart';
import 'karakter.dart';

class AnaSayfa extends StatefulWidget {

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";

  List<Karakter> _butunKarakterler = [];

  List<String> _favoriKarakterKodlari = [];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favorileriCihazHafizasindanCek().then((value){
        _karakterleriInternettenCek();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text("Rick and Morty"),
      centerTitle: true,
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          onPressed: (){
            _favorilerSayfasiniAc(context);
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(){
    return _butunKarakterler.isEmpty
      ? Center(child: CircularProgressIndicator(),)
      : OrtakListe(_butunKarakterler, _favoriKarakterKodlari);
  }


  void _karakterleriInternettenCek() async {
    int page = 1;
    bool fetching = true;

    while (fetching) {
      Uri uri = Uri.parse("$_apiUrl?page=$page");
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = jsonDecode(response.body);
        List<dynamic> karakterlerListesi = parsedResponse["results"];

        for (int i = 0; i < karakterlerListesi.length; i++) {
          Map<String, dynamic> karakterMap = karakterlerListesi[i];
          Karakter karakter = Karakter.fromMap(karakterMap);
          _butunKarakterler.add(karakter);
        }

        // Check if there are more pages
        if (parsedResponse['info']['next'] != null) {
          page++;
        } else {
          fetching = false;
        }
      } else {
        throw Exception("Failed to load characters");
      }
    }

    setState(() {});
  }


  Future<void> _favorileriCihazHafizasindanCek() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriler = prefs.getStringList("favoriler");

    if(favoriler != null){
      for(String ulkeKodu in favoriler){
        _favoriKarakterKodlari.add(ulkeKodu);
      }
    }
  }

  void _favorilerSayfasiniAc(BuildContext context) {
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (context) {
        return Favoriler(_butunKarakterler, _favoriKarakterKodlari);
      },
    );
    Navigator.push(context, sayfaYolu);
  }
}


