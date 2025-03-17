import 'package:flutter/material.dart';

class crosswordWidget extends StatefulWidget {
  const crosswordWidget({super.key});

  @override
  State<crosswordWidget> createState() => _crosswordWidgetState();
}

class _crosswordWidgetState extends State<crosswordWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateRandomWord();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: size.width,
          color: Colors.red,
          padding: const EdgeInsets.all(10),
          child: const Text("Box"),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text("List"),
        ),
      ],
    );
  }

  void generateRandomWord()
  {
    final List<String> w1 = ['hello','world','foo','bar','baz','dart'];
  }
}
