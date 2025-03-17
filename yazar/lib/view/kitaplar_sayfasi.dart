import 'package:flutter/material.dart';

class KitaplarSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: _buildKitapEkleFab(context),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text("Kitaplar Sayfasi"),
    );
  }

  Widget _buildKitapEkleFab(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        _kitapEkle(context);
      },
    );
  }

  void _kitapEkle(BuildContext context){
    _pencereAc(context);
  }

  void _pencereAc(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        String? sonuc;

        return AlertDialog(
          title: Text("Kitap Adını Giriniz"),
          content: TextField(
            onChanged: (yeniDeger){
              sonuc = yeniDeger;
            },
          ),
          actions: [
            TextButton(
              child: Text("İptal"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("Onayla"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
