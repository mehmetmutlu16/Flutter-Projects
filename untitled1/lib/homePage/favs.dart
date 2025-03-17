import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/homePage/pokeInfoPage.dart';
import 'package:untitled1/homePage/pokemons.dart';

import '../widgets/loading.dart';

class favs extends StatefulWidget {
  const favs({super.key});

  @override
  State<favs> createState() => _favsState();
}

class _favsState extends State<favs> {
  List<String> favoriPokemonlar = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favorileriCihazHafizasindanCek().then((value) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: const Center(
          child: Text("Favorite Pokemon's"),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return favoriPokemonlar.isEmpty
      ? const Center(child: Loading(),)
      : Padding(
      padding: const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 5),
      child: GridView.builder(
        itemCount: favoriPokemonlar.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return buildColumn(context, favoriPokemonlar[index]);
        },
      ),
    );
  }

  Widget buildColumn(BuildContext context, String pokemonNo) {
    int gecici = int.tryParse(pokemonNo) ?? 0;

    if (pokemonlar.isEmpty) {
      return Container();
    } else {
      return pokeOlustur(context, gecici);
    }
  }

  Column pokeOlustur(BuildContext context, int gecici) {
    gecici -= 1;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => pokeInfoPage(pokeNumber: gecici)),
            );
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
              color: Colors.teal[100],
            ),
            child: Column(
              children: [
                Expanded(child: Image.asset(pokemonlar[gecici].image)),
                Text(pokemonlar[gecici].name),
                Text(pokemonlar[gecici].pokeNumber),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _favorileriCihazHafizasindanCek() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriler = prefs.getStringList("favoriler");

    if (favoriler != null) {
      // Favorileri integer'a çevirip sıralayın
      List<int> favorilerInt = favoriler.map((e) => int.tryParse(e) ?? 0).toList();
      favorilerInt.sort();
      // Sıralı integer listesini tekrar string listesine çevirin
      favoriPokemonlar = favorilerInt.map((e) => e.toString()).toList();
    }
  }
}
