import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'karakter.dart';
import 'ortak_liste.dart';

class Favoriler extends StatefulWidget {
  final List<Karakter> _butunKarakterler;

  final List<String> _favoriKarakterKodlari;


  Favoriler(this._butunKarakterler, this._favoriKarakterKodlari);

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<Karakter> _favoriKarakterler = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(Karakter ulke in widget._butunKarakterler){
      if(widget._favoriKarakterKodlari.contains(ulke.id)){
        _favoriKarakterler.add(ulke);
      }
    }
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
      title: Text("Favoriler"),
      centerTitle: true,
      backgroundColor: Colors.teal[200],
    );
  }

  Widget _buildBody(){
    return OrtakListe(_favoriKarakterler, widget._favoriKarakterKodlari);
  }
}
