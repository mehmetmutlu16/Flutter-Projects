import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'karakter.dart';
import 'karakter_detay_sayfasi.dart';

class OrtakListe extends StatefulWidget {

  List<Karakter> karakterler = [];

  List<String> _favoriKarakterKodlari = [];

  OrtakListe(this.karakterler, this._favoriKarakterKodlari);

  @override
  State<OrtakListe> createState() => _OrtakListeState();
}

class _OrtakListeState extends State<OrtakListe> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.karakterler.length,
      itemBuilder: _buildListItem,
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Karakter karakter = widget.karakterler[index];

    Color statusColor = Colors.grey; // Default color for unknown status
    if (karakter.status.toLowerCase() == "alive") {
      statusColor = Colors.green;
    } else if (karakter.status.toLowerCase() == "dead") {
      statusColor = Colors.red;
    }

    return Card(
      child: ListTile(
        title: Text(
          karakter.name,
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          "Karakter ID: ${karakter.id}",
          style: TextStyle(
          ),
        ),
        leading: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(karakter.image),
            ),
            Icon(Icons.circle, size: 12,
              color: statusColor,
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            widget._favoriKarakterKodlari.contains(karakter.id)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: (){
            _favoriTiklandi(karakter);
          },
        ),
        onTap: (){
          _karakterTiklandi(context, karakter);
        },
      ),
    );
  }

  void _karakterTiklandi(BuildContext context, Karakter karakter){
    MaterialPageRoute sayfaYolu = MaterialPageRoute(
      builder: (context) {
        return KarakterDetaySayfasi(karakter);
      },
    );
    Navigator.push(context, sayfaYolu);
  }

  void _favoriTiklandi(Karakter karakter) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(widget._favoriKarakterKodlari.contains(karakter.id)){
      widget._favoriKarakterKodlari.remove(karakter.id);
    }else{
      widget._favoriKarakterKodlari.add(karakter.id);
      print("eklendi");
    }

    await prefs.setStringList("favoriler", widget._favoriKarakterKodlari);

    setState(() { });
  }
}
