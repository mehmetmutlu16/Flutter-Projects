import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pokemons.dart';

class pokeInfoPage extends StatefulWidget {
  int pokeNumber;

  pokeInfoPage({required this.pokeNumber});

  @override
  State<pokeInfoPage> createState() => _pokeInfoPageState();
}

class _pokeInfoPageState extends State<pokeInfoPage> {
  bool isLiked = false;

  List<String> favoriPokemonlar = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _favorileriCihazHafizasindanCek().then((value) {
        int yeniPokeNumber = widget.pokeNumber + 1;
        if (favoriPokemonlar.contains(yeniPokeNumber.toString())) {
          setState(() {
            isLiked = true;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Center(
            child: Text(pokemonlar[widget.pokeNumber].name),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: isLiked ? const Icon(Icons.favorite, color: Colors.black,) : const Icon(Icons.favorite_border , color: Colors.black,),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
                if(widget.pokeNumber==0)
                {
                  _favoriTiklandi(pokemonlar[0]);
                }else{
                  _favoriTiklandi(pokemonlar[widget.pokeNumber]);
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          shape: BoxShape.rectangle,
                          color: Colors.teal[100],
                        ),
                        height: 180,
                        child: Image.asset(pokemonlar[widget.pokeNumber].image),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                            color: Colors.teal[100],
                          ),
                          height: 30,
                          child: pokeType(widget.pokeNumber),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                            color: Colors.teal[100],
                          ),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(pokemonlar[widget.pokeNumber].hp, style: const TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                            color: Colors.teal[100],
                          ),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(pokemonlar[widget.pokeNumber].pokeType1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(pokemonlar[widget.pokeNumber].attackName1, style: const TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                            color: Colors.teal[100],
                          ),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(pokemonlar[widget.pokeNumber].pokeType1),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset('assets/pokeTypes/NormalType.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(pokemonlar[widget.pokeNumber].attackName2, style: const TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            shape: BoxShape.rectangle,
                            color: Colors.teal[100],
                          ),
                          height: 180,
                          child: evolve(widget.pokeNumber),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _favorileriCihazHafizasindanCek() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? favoriler = prefs.getStringList("favoriler");

    if(favoriler != null){
      for(String no in favoriler){
        favoriPokemonlar.add(no);
      }
    }
  }

  void _favoriTiklandi(pokemons pokemon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (favoriPokemonlar.contains(pokemon.pokeNumber.toString())) {
      favoriPokemonlar.remove(pokemon.pokeNumber.toString());
      Fluttertoast.showToast(
        msg: "Pokemon Favorilerden Çıkarıldı",
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16,
      );
    } else {
      favoriPokemonlar.add(pokemon.pokeNumber.toString());
      Fluttertoast.showToast(
        msg: "Pokemon Favorilere Eklendi",
        backgroundColor: Colors.deepOrangeAccent,
        textColor: Colors.white,
        fontSize: 16,
      );
    }

    await prefs.setStringList("favoriler", favoriPokemonlar);

    setState(() {});
  }
}

Widget pokeType(int pokeNumber){
  if(pokemonlar[pokeNumber].pokeTypeNo == 1){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(pokemonlar[pokeNumber].pokeType1),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(pokemonlar[pokeNumber].type1Name, style: const TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ],
    );
  }
  else if(pokemonlar[pokeNumber].pokeTypeNo == 2){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(pokemonlar[pokeNumber].pokeType1),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(pokemonlar[pokeNumber].type1Name , style: const TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(pokemonlar[pokeNumber].pokeType2),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(pokemonlar[pokeNumber].type2Name , style: const TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ],
    );
  }
  else{
    return const SizedBox();
  }
}

Widget evolve(int pokeNumber){
  if(pokemonlar[pokeNumber].evolve == 1){
    return Row(
      children: [
        Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
      ],
    );
  }
  else if(pokemonlar[pokeNumber].evolve == 2){
    if(pokemonlar[pokeNumber].evolveNo == 1){
      return Row(
        children: [
          Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber+1].image)),
        ],
      );
    }else if(pokemonlar[pokeNumber].evolveNo == 2){
      return Row(
        children: [
          Expanded(child: Image.asset(pokemonlar[pokeNumber-1].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
        ],
      );
    }

  }
  else{
    if(pokemonlar[pokeNumber].evolveNo == 1){
      return Row(
        children: [
          Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber+1].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber+2].image)),
        ],
      );
    }else if(pokemonlar[pokeNumber].evolveNo == 2){
      return Row(
        children: [
          Expanded(child: Image.asset(pokemonlar[pokeNumber-1].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber+1].image)),
        ],
      );
    }else if(pokemonlar[pokeNumber].evolveNo == 3){
      return Row(
        children: [
          Expanded(child: Image.asset(pokemonlar[pokeNumber-2].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber-1].image)),
          Expanded(child: Image.asset(pokemonlar[pokeNumber].image)),
        ],
      );
    }

  }
  return const SizedBox();
}

