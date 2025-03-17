import 'package:flutter/material.dart';

class lutfenTikla extends StatefulWidget {
  const lutfenTikla({super.key});

  @override
  State<lutfenTikla> createState() => _lutfenTiklaState();
}

class _lutfenTiklaState extends State<lutfenTikla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text("İLAYDAM"),
          centerTitle: true,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Bitanem\nSeni bu dünyadaki her şeyden daha çok seviyorum.\nAramız hiç bozulmasın bebeğim.\nBirlikte büyüdük, büyüyoruz. Güzelleşiyoruz.\nİyi ki doğmuşsun. İyi ki benimsin.\nİyi ki seninim.\nBaşıma gelen en güzel şeysin.\nHayatımın anlamı hayatımını rengisin.\nGüzel olan her şeyin mimarısın.\nBenim her şeyimsin.\nSeni hep çok sevicem.\nSenin iyi olman benim mutlu olmam için yeterli.\nDünyadaki tüm çiçekleri önüne sersem\ngüzelliğini kıskansalar, iç çekseler.\nSenle yıldızlara baksak\ngözlerinin parıltısını kıskansalar.\nSenle tüm manzaraları gezsek el ele\nGünbatımları seyretsek sarılarak\nTüm manzaraların önünde\nmanzara olduğundan habersiz dursan\nSonsuza kadar benimle kalsan\nSonsuza kadar seni sevsem\n(bana yine de yetmez de neyse)\nSeni çok seviyorum\nİyi ki varsın.\nİyi ki benimlesin.\nHep benimle kal.\nMuuuuaaaaahhhhh.", style: TextStyle(fontSize: 15),))
          ],
        ),
    );
  }
}
