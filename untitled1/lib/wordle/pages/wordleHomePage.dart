import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/changePage.dart';
import 'package:untitled1/wordle/pages/settings.dart';

import '../components/grid.dart';
import '../components/keyboard_row.dart';
import '../components/stats_box.dart';
import '../constants/words.dart';
import '../providers/controller.dart';
import '../utils/quick_box.dart';

class wordleHomePage extends StatefulWidget {
  const wordleHomePage({super.key});

  @override
  State<wordleHomePage> createState() => _wordleHomePageState();
}

class _wordleHomePageState extends State<wordleHomePage> {

  late String _word;

  @override
  void initState() {
    final r = Random().nextInt(words.length);
    _word = words[r];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<Controller>(context, listen: false).setCorrectWord(word: _word);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Wordle'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => changePage()));
          },
        ),
        actions: [
          Consumer<Controller>(
            builder: (_, notifier, __){
              if(notifier.notEnoughtLetters){
                runQuickbox(context: context, message: 'Not Enough Letters');
              }
              if(notifier.gameCompleted){
                if(notifier.gameWon){
                  if(notifier.currentRow == 5){
                    runQuickbox(context: context, message: 'Phew!');
                  }else{
                    runQuickbox(context: context, message: 'Splendid!');
                  }
                }else{
                  runQuickbox(context: context, message: notifier.correctWord);
                }
                Future.delayed(const Duration(milliseconds: 4000), (){
                  if(mounted){
                    showDialog(context: context, builder: (_) => const StatsBox());
                  }
                });
              }
              return IconButton(
                onPressed: () async {
                  showDialog(context: context, builder: (_) => const StatsBox());
                },
                icon: const Icon(Icons.bar_chart_outlined),
              );
            },
          ),
          IconButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Settings()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Column(
        children: [
          Divider(
            height: 1,
            thickness: 2,
          ),
          Expanded(
            flex: 7,
            child: Grid(),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                KeyboardRow(min: 1, max:10),
                KeyboardRow(min: 11, max:19),
                KeyboardRow(min: 20, max:29),
              ],
            ),
          )
        ],
      ),
    );
  }
}
