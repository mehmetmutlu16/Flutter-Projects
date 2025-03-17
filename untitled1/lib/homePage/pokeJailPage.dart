import 'package:flutter/material.dart';
import 'package:untitled1/homePage/pokemons.dart';

class pokeJail extends StatefulWidget {
  int pokeNumber;

  pokeJail({required this.pokeNumber});

  @override
  State<pokeJail> createState() => _pokeJailState();
}

class _pokeJailState extends State<pokeJail> {

  int currentStep = 0;
  String jail = "assets/jail.png";

  List<Step> getSteps() => [
    Step(
      isActive: currentStep >= 0,
      title: Text("1.Step"),
      content: Container(
        child: Text("Selam"),
      )
    ),
    Step(
      isActive: currentStep >= 1,
      title: Text("2.Step"),
      content: Container()
    ),
    Step(
      isActive: currentStep >= 2,
      title: Text("3.Step"),
      content: Container()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: const Icon(Icons.dangerous),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Image.asset(pokemonlar[widget.pokeNumber].image, width: 150,),
                    Image.asset(jail, width: 150,)
                  ],
                ),
              ],
            ),
            Expanded(
              child: Stepper(
                type: StepperType.vertical,
                steps: getSteps(),
                currentStep: currentStep,
                onStepContinue: (){
                  final isLastStep = currentStep == getSteps().length-1;
                  if(isLastStep){
                    print("Bitti");
                  }
                  setState(() {
                    currentStep += 1;
                  });
                },
                onStepCancel: currentStep == 0 ? null : () => setState(() => currentStep -=1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
