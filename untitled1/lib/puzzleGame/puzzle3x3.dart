import 'dart:async';
import 'package:flutter/material.dart';
import '../changePage.dart';


class puzzle3x3 extends StatefulWidget {

  int imageChoose;

  puzzle3x3({required this.imageChoose});

  @override
  _puzzle3x3State createState() => _puzzle3x3State();
}

class _puzzle3x3State extends State<puzzle3x3> {
  List<int> numbers = List.generate(8, (index) => index + 1);
  int emptyIndex = 8;
  int move = 0;

  late Timer _timer;
  int _counter = 0;


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          _counter++;
        },
      ),
    );
  }

  void stopTimer() {
    _timer.cancel();
  }

  void resetTimer() {
    _timer.cancel();

    setState(() {
      _counter = 0;
    });
    startTimer();
  }


  @override
  void initState() {
    startTimer();
    numbers.shuffle();
    // TODO: implement initState
    super.initState();
    numbers.add(9);
  }

  void _onTileClicked(int index) {
    move++;
    if (isAdjacent(index, emptyIndex)) {
      setState(() {
        swap(index, emptyIndex);
        emptyIndex = index;
      });
      checkIfSolved();
    }
  }

  bool isAdjacent(int index1, int index2) {
    int x1 = index1 % 3;
    int y1 = index1 ~/ 3;
    int x2 = index2 % 3;
    int y2 = index2 ~/ 3;

    return (x1 == x2 && (y1 - y2).abs() == 1) || (y1 == y2 && (x1 - x2).abs() == 1);
  }

  void swap(int index1, int index2) {
    int temp = numbers[index1];
    numbers[index1] = numbers[index2];
    numbers[index2] = temp;
  }

  void reset(){
    setState(() {
      numbers.shuffle();
      resetTimer();
      move = 0;
    });
  }

  void checkIfSolved() {
    bool solved = true;
    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] != i + 1) {
        solved = false;
        break;
      }
    }

    if (solved) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          stopTimer();
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              backgroundColor: Colors.teal[100],
              title: const Text('Congrulations'),
              content: const Text('Puzzle Solved!!!'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const changePage()),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Widget buildImage(){
    if(widget.imageChoose==0) {
      return Image.asset('assets/puzzleGame/3x3/reference.jpg');
    }
    return const SizedBox(width: 0,height: 0,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3x3 Puzzle'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.61,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                if (index == emptyIndex) {
                  return Container();
                } else {
                  return GestureDetector(
                    onTap: () => _onTileClicked(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      margin: const EdgeInsets.all(6.0),
                      child: Center(
                        child: choosenPhoto(index),
                      ),
                    ),
                  );
                }
              }),
            ),
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: buildImage(),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                          'Move' ': $move',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                          'Time: $_counter',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: reset,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                      ),
                      child: const Text('Reset', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Image choosenPhoto(int index) {
    if (widget.imageChoose == 0) {
      return Image.asset(
          'assets/puzzleGame/3x3/image_part_00${numbers[index]}.png');
    }
    if (widget.imageChoose == 1) {
      return Image.asset(
          'assets/puzzleGame/3x3/image_part_00${numbers[index]}.png');
    }
    return Image.asset(
        'assets/puzzleGame/3x3/image_part_00${numbers[index]}.png');
  }
}
