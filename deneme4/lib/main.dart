import 'package:deneme4/ilkSayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> numbers = [
    '1', '2', '3',
    '4', '5', '6',
    '7', '8', '9',
    'C', '0', 'OK',
  ];

  String enteredText = ''; // Girilen sayıları tutmak için bir değişken

  void kacakGiris(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation1, animation2){
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget){
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Center(child: Text("SİFRE YANLIŞ")),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("OK", style: TextStyle(color: Colors.black),),
                  ),
                ],
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "İ M",
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Selamlaar"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                width: 300,
                height: 50,
                child: Center(child: Text(enteredText, style: TextStyle(fontSize: 40),)),
              ),
            ),
            Center(
              child: Container(
                height: 400,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  itemCount: numbers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final number = numbers[index];
                    return InkWell(
                      onTap: () {
                        if (number == 'C') {
                          setState(() {
                            enteredText = '';
                          });
                        } else if(number == 'OK'){
                          setState(() {
                            if(enteredText=="1001"){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ilkSayfa()));
                            }else{
                              kacakGiris(context);
                              enteredText = '';
                            }
                          });
                        }else {
                          setState(() {
                            enteredText += number;
                          });
                        }
                      },
                      child: Container(
                        height: 10,
                        width: 10,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          color: Colors.white,
                        ),
                        child: Text(
                          number,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
