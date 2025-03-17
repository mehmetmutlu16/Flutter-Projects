import 'package:flutter/material.dart';

import 'karakter.dart';

class KarakterDetaySayfasi extends StatelessWidget {
  final Karakter _karakter;

  KarakterDetaySayfasi(this._karakter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_karakter.name),
      centerTitle: true,
      backgroundColor: Colors.redAccent[100],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 32,
        ),
        _buildBayrak(context),
        SizedBox(height: 24,),
        _buildUlkeIsmiText(),
        SizedBox(height: 36,),
        _buildTumDetaylar(),
      ],
    );
  }

  Widget _buildTumDetaylar(){
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        children: [
          _buildDetayRow("Karakter ID: ", _karakter.id),
          _buildDetayRow("İsim: ", _karakter.name),
          _buildDetayRow("Status: ", _karakter.status),
          _buildDetayRow("Species: ", _karakter.species),
          _buildDetayRow("Karakter Tipi: ", _karakter.type),
          _buildDetayRow("Cinsiyet: ", _karakter.gender),
        ],
      ),
    );
  }

  Widget _buildBayrak(BuildContext context){
    return Image.network(
      _karakter.image,
      width: MediaQuery.sizeOf(context).width / 2,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildUlkeIsmiText(){
    return Text(
      _karakter.name,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDetayRow(String baslik, String detay){
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            baslik,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          flex: 3,
          child: Text(
            detay,
            style: TextStyle(
                fontSize: 22
            ),
          ),
        ),
      ],
    );
  }

}
