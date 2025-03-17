import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class sarkiOnerisi extends StatefulWidget {
  const sarkiOnerisi({super.key});

  @override
  State<sarkiOnerisi> createState() => _sarkiOnerisiState();
}

class _sarkiOnerisiState extends State<sarkiOnerisi> {

  List<String> sarkilar = [
    "Dünyanın En Güzel Kızı - Mavi Gri",
    "Neden Bu Kadar Güzelsin - Skapova",
    "Sevsene Beni - Yedinci Ev",
    "Ellerim Seni İstedi - Perdenin Ardındakiler",
    "Jest Oldu - Karsu",
    "Sadece - Kalben",
    "Derdimin Çiçeği - Kalben",
    "Elleri Ellerime - Duman",
    "Benim İstanbulum Sensin - Güneş",
    "Seni Buldum Ya - Kaan Boşnak",
    "Sevdim Seni Bir Kere - Teo Abim",
    "Senden Daha Güzel - Duman",
    "Kalbimden Tenime - Canozan",
    "Seni Uyurken İzlemek - Sedef Sebüktekin",
    "Ben Her Zaman Sana Aşıktım - Kalben",
    "Kıskanıyorum - Göksel",
    "Creep - Radiohead",
    "Delilerin Aşkı>>> - Kum",
    "Dem - Can Bonomo",
    "Bana Ellerini Ver - Özdemir Erdoğan"
  ];

  int _randomNumber = 1;

  void _generateRandomNumber() {
    final random = Random();
    setState(() {
      _randomNumber = random.nextInt(sarkilar.length); // 0 ile 99 arasında rastgele bir sayı üretir
    });
  }

  final double progressValue = 0.5; // İlerleme değerini ayarlayabilirsiniz (0.0 ile 1.0 arasında)

  final Uri _url = Uri.parse('https://flutter.dev');

  final List<Uri> _urls = [
    Uri.parse('https://open.spotify.com/track/3M3sdBf1qG5WkhNYXIq7sK?si=60de4799c5464de8'),
    Uri.parse('https://open.spotify.com/track/65UH6G3VdwHicwrZ2CnYHb?si=148bac73930541c9'),
    Uri.parse('https://open.spotify.com/track/6TeZMqzbKBzm2APh2aZk6U?si=894cf729500f49b6'),
    Uri.parse('https://open.spotify.com/track/4TTUkNtDuYnDfTiDxrD5Bh?si=a57ae2fea3cb40dc'),
    Uri.parse('https://open.spotify.com/track/36od5gfj11fNcwuFKK7x4J?si=349ba6bedccf4ada'),
    Uri.parse('https://open.spotify.com/track/5PBCWGudD3lw0Qhk7jLMUo?si=49c0c777f2904f9f'),
    Uri.parse('https://open.spotify.com/track/0sULDifDFLkH5zAo3L5iFi'),
    Uri.parse('https://open.spotify.com/track/0o16NrUwcH3U0fEEPD79VB?si=72a8014b58854727'),
    Uri.parse('https://open.spotify.com/track/6MnB500gDVMIiGJbhJZbDw?si=4f732a837aa44691'),
    Uri.parse('https://open.spotify.com/track/0raPeXeRFHkq1vrLPw6Xj8?si=6807d4b59bd341b5'),
    Uri.parse('https://open.spotify.com/track/73Dq5bAe6PvhKstTc0sVkp?si=db6aac89d382428b'),
    Uri.parse('https://open.spotify.com/track/2sLAykCWyB1VA5hXDjU59T?si=a1895fe2ff604dc8'),
    Uri.parse('https://open.spotify.com/track/1JiAHGU2xjAix2zNVILtmr?si=af7bc6cbc0df4204'),
    Uri.parse('https://open.spotify.com/track/0zCa9mycRcZOG7rrY3kw36?si=b3f05a9a576f4c89'),
    Uri.parse('https://open.spotify.com/track/4CWwQBDEI444gJh9rSg6iB?si=b2a7709e16ce4de2'),
    Uri.parse('https://open.spotify.com/track/0uO8GWUPaORv4UfeyJmFyI?si=d9ab07598e4244cd'),
    Uri.parse('https://open.spotify.com/track/70LcF31zb1H0PyJoS1Sx1r?si=2d18cc1191ea4b59'),
    Uri.parse('https://open.spotify.com/track/7jXaILeXpFbk73W6xHTDVg?si=a0ca9fe8bd0a4e18'),
    Uri.parse('https://open.spotify.com/track/2aUycmP66tY4wr3zt1sGc0?si=2d948096393b46e6'),
    Uri.parse('https://open.spotify.com/track/3VLpmvlGkGeLWME8qRShOQ?si=d94e27f1f6534dd7'),
  ];

  Future<void> _launchUrl() async {
    if (!await launchUrl(_urls[_randomNumber])) {
      throw Exception('Could not launch $_url');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: Text("Dj Memooo"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 300,
            height: 300,
            child: Image.asset('images/resim11.jpg'),
          ),
          Center(
            child: Text(sarkilar[_randomNumber], style: TextStyle(fontSize: 22),),
          ),
          Container(
            width: 300,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              value: progressValue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous_rounded,size: 40,),
              Icon(Icons.pause_sharp,size: 40,),
              Icon(Icons.skip_next_rounded,size: 40,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: (){
                    _generateRandomNumber();
                  },
                  child: Text("Başkaa", style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _launchUrl,
                  child: Text("Şarkıya Git", style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
