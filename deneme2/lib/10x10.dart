import 'package:flutter/material.dart';

import 'levels/10x10/level1.dart';
import 'levels/5x5/level2.dart';

class tenXten extends StatefulWidget {
  const tenXten({super.key});

  @override
  State<tenXten> createState() => _tenXtenState();
}

class _tenXtenState extends State<tenXten> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("10x10"),
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
