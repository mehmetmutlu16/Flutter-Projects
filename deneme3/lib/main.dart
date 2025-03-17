import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int?> board = List.filled(10, null); // Tahta 10 kutucuktan oluşuyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oyun Tahtası'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Üstteki sayıların yer aldığı satır
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(10, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable<int>(
                    data: index + 1,
                    feedback: Material(
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    childWhenDragging: Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 50),
          // Alt tahtanın yer aldığı satır
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DragTarget<int>(
                  onAccept: (data) {
                    setState(() {
                      board[index] = data;
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      width: 50,
                      height: 50,
                      color: board[index] != null ? Colors.green : Colors.red,
                      child: Center(
                        child: Text(
                          board[index]?.toString() ?? '',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
