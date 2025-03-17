import 'package:flutter/material.dart';

import 'levels/5x5/level1.dart';
import 'levels/5x5/level2.dart';

class fiveXfive extends StatefulWidget {
  const fiveXfive({super.key});

  @override
  State<fiveXfive> createState() => _fiveXfiveState();
}

class _fiveXfiveState extends State<fiveXfive> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("5x5"),
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
                itemCount: 2,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      if(index == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const level1()));
                      }else if(index == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const level2()));
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
