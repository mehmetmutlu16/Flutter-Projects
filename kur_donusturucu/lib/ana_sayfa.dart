import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Ana_Sayfa extends StatefulWidget {
  const Ana_Sayfa({super.key});

  @override
  State<Ana_Sayfa> createState() => _Ana_SayfaState();
}

class _Ana_SayfaState extends State<Ana_Sayfa> {
  final String _apiKey = "15fc00107111d292bec380bca27ec78d";
  final String _baseUrl = "http://api.exchangeratesapi.io/v1/latest?access_key=";

  TextEditingController _controller = TextEditingController();

  Map<String, double> _oranlar = {};

  String _secilenKur = "USD";
  double _sonuc = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kur Dönüştürücü"),
        centerTitle: true,
        backgroundColor: Colors.purple
        ,
      ),
      body: _oranlar.isNotEmpty
          ? _buildBody()
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildBody(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                  onChanged: (String yeniDeger){
                    _hesapla();
                  },
                ),
              ),
              SizedBox(width: 16,),
              DropdownButton<String>(
                value: _secilenKur,
                icon: Icon(Icons.arrow_downward),
                underline: SizedBox(),
                items: _oranlar.keys.map((String kur) {
                  return DropdownMenuItem<String>(
                    value: kur,
                    child: Text(kur),
                  );
                }).toList(),
                onChanged: (String? yeniDeger){
                  if(yeniDeger != null){
                    setState(() {
                      _secilenKur = yeniDeger;
                    });
                    _hesapla();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 16,),
          Text("${_sonuc.toStringAsFixed(2)} ₺", style: TextStyle(fontSize: 24),),
          Container(
            height: 2,
            color: Colors.black,
          ),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.builder(
              itemCount: _oranlar.keys.length,
              itemBuilder: _buildListItem,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index){
    return ListTile(
      title: Text(_oranlar.keys.toList()[index]),
      trailing: Text("${_oranlar.values.toList()[index].toStringAsFixed(2)} ₺"),
      
    );
  }

  void _hesapla(){
    double? deger = double.tryParse(_controller.text);
    double? oran = _oranlar[_secilenKur];

    if(deger != null && oran != null){
      setState(() {
        _sonuc = deger * oran;
      });
    }
  }

  void _verileriInternettenCek() async{
    Uri uri = Uri.parse(_baseUrl + _apiKey);
    http.Response response = await http.get(uri);

    Map<String, dynamic> parsedResponse = jsonDecode(response.body);

    Map<String, dynamic> rates = parsedResponse["rates"];

    double? baseTlKuru = rates["TRY"];

    if(baseTlKuru != null){
      for(String ulkeKuru in rates.keys){
        double? baseKur = double.tryParse(rates[ulkeKuru].toString());
        if(baseKur != null){
          double tlKuru = baseTlKuru / baseKur;
          _oranlar[ulkeKuru] = tlKuru;
        }
      }
    }

    setState(() {});
  }
}
