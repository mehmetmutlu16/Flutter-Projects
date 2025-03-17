import 'package:flutter/material.dart';
import 'package:ulkeler/ortak_liste.dart';
import 'package:ulkeler/ulke.dart';

class Favoriler extends StatefulWidget {
  final List<Ulke> _butunUlkeler;

  final List<String> _favoriUlkeKodlari;


  Favoriler(this._butunUlkeler, this._favoriUlkeKodlari);

  @override
  State<Favoriler> createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  List<Ulke> _favoriUlkeler = [];

  @override
  void initState() {
    super.initState();
    for(Ulke ulke in widget._butunUlkeler){
      if(widget._favoriUlkeKodlari.contains(ulke.ulkeKodu)){
        _favoriUlkeler.add(ulke);
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
    return OrtakListe(_favoriUlkeler, widget._favoriUlkeKodlari);
  }
}
