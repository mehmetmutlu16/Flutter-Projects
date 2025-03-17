import 'package:flutter/material.dart';

class memoCard extends StatefulWidget {
  const memoCard({super.key});

  @override
  State<memoCard> createState() => _memoCardState();
}

class _memoCardState extends State<memoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text("Memo CV"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/1.jpg')),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20,bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('En Sevdiği Şey'),
            ),
          ),
          Container(
            width: 320,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text("İLAYDA")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20,bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('En Sevdiği Yemek'),
            ),
          ),
          Container(
            width: 320,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text("İLAYDA")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20,bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('En Sevdiği Tatlı'),
            ),
          ),
          Container(
            width: 320,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text("İLAYDA")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20,bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Favori Prensesi'),
            ),
          ),
          Container(
            width: 320,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text("İLAYDA")),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20,bottom: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Favori konum'),
            ),
          ),
          Container(
            width: 320,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(child: Text("İLAYDASININ YANI")),
          ),
        ],
      ),
    );
  }
}
