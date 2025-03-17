import 'package:flutter/material.dart';

import 'levels/15x15/level1.dart';

class fifteenXfifteen extends StatefulWidget {
  const fifteenXfifteen({super.key});

  @override
  State<fifteenXfifteen> createState() => _fifteenXfifteenState();
}

class _fifteenXfifteenState extends State<fifteenXfifteen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("15x15"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      if(index == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const level1()));
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white60,
                      ),
                      child: Center(
                        child: Text("Level ${index+1}"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
