import 'package:flutter/material.dart';
import 'package:untitled1/homePage/pokeInfoPage.dart';
import 'package:untitled1/homePage/pokemons.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text("Pokedex"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12, left: 12,right: 12,bottom: 5),
          child: GridView.builder(
            itemCount: 128,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, pokeNo){
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => pokeInfoPage(pokeNumber: pokeNo,)));
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
                          Expanded(child: Image.asset(pokemonlar[pokeNo].image)),
                          Text(pokemonlar[pokeNo].name),
                          Text(pokemonlar[pokeNo].pokeNumber),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
  }
}
