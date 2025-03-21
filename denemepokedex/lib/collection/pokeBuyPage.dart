import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/themeSettings.dart';

class pokeBuyPage extends StatefulWidget {
  @override
  _pokeBuyPageState createState() => _pokeBuyPageState();
}

class _pokeBuyPageState extends State<pokeBuyPage> with WidgetsBindingObserver{
  String imageFlorass = 'assets/mos/001.png';
  String nameFlorass = 'Florass';
  bool hasFlorass = false;
  String imageSparkie = 'assets/mos/002.png';
  String nameSparkie = 'Sparkie';
  bool hasSparkie = false;
  String imageSparken = 'assets/mos/003.png';
  String nameSparken = 'Sparken';
  bool hasSparken = false;
  String imageAquadra = 'assets/mos/004.png';
  String nameAquadra = 'Aquadra';
  bool hasAquadra = false;
  String imageShockwing = 'assets/mos/005.png';
  String nameShockwing = 'Shockwing';
  bool hasShockwing = false;
  String imageZapwing = 'assets/mos/006.png';
  String nameZapwing = 'Zapwing';
  bool hasZapwing = false;
  String imageJoltur = 'assets/mos/007.png';
  String nameJoltur = 'Joltur';
  bool hasJoltur = false;
  String imageJoltrik = 'assets/mos/008.png';
  String nameJoltrik = 'Joltrik';
  bool hasJoltrik = false;
  String imageMysticon = 'assets/mos/009.png';
  String nameMysticon = 'Mysticon';
  bool hasMysticon = false;
  String imagePsypup = 'assets/mos/010.png';
  String namePsypup = 'Psypup';
  bool hasPsypup = false;
  String imagePsydog = 'assets/mos/011.png';
  String namePsydog = 'Psydog';
  bool hasPsydog = false;
  String imageDolphineon = 'assets/mos/012.png';
  String nameDolphineon = 'Dolphineon';
  bool hasDolphineon = false;
  String imageRockslide = 'assets/mos/013.png';
  String nameRockslide = 'Rockslide';
  bool hasRockslide = false;
  String imageRockfist = 'assets/mos/014.png';
  String nameRockfist = 'Rockfist';
  bool hasRockfist = false;
  String imageSilentpaw = 'assets/mos/015.png';
  String nameSilentpaw = 'Silentpaw';
  bool hasSilentpaw = false;
  String imageShadowclaw = 'assets/mos/016.png';
  String nameShadowclaw = 'Shadowclaw';
  bool hasShadowclaw = false;
  String imageElectromon = 'assets/mos/017.png';
  String nameElectromon = 'Electromon';
  bool hasElectromon = false;
  String imageEaglestorm = 'assets/mos/018.png';
  String nameEaglestorm = 'Eaglestorm';
  bool hasEaglestorm = false;
  String imageSkywing = 'assets/mos/019.png';
  String nameSkywing = 'Skywing';
  bool hasSkywing = false;
  String imageWoolie = 'assets/mos/020.png';
  String nameWoolie = 'Woolie';
  bool hasWoolie = false;
  String imageWooliec = 'assets/mos/021.png';
  String nameWooliec = 'Wooliec';
  bool hasWooliec = false;
  String imageWooliectra = 'assets/mos/022.png';
  String nameWooliectra = 'Wooliectra';
  bool hasWooliectra = false;
  String imageSpookums = 'assets/mos/023.png';
  String nameSpookums = 'Spookums';
  bool hasSpookums = false;
  String imageSpookram = 'assets/mos/024.png';
  String nameSpookram = 'Spookram';
  bool hasSpookram = false;
  String imageNimowl = 'assets/mos/025.png';
  String nameNimowl = 'Nimowl';
  bool hasNimowl = false;
  String imageWisowl = 'assets/mos/026.png';
  String nameWisowl = 'Wisowl';
  bool hasWisowl = false;
  String imageFliefox = 'assets/mos/027.png';
  String nameFliefox = 'Fliefox';
  bool hasFliefox = false;
  String imageFluffox = 'assets/mos/028.png';
  String nameFluffox = 'Fluffox';
  bool hasFluffox = false;
  String imageDrogie = 'assets/mos/029.png';
  String nameDrogie = 'Drogie';
  bool hasDrogie = false;
  String imageDrogice = 'assets/mos/030.png';
  String nameDrogice = 'Drogice';
  bool hasDrogice = false;
  String imageDrogrost = 'assets/mos/031.png';
  String nameDrogrost = 'Drogrost';
  bool hasDrogrost = false;
  String imageMonrass = 'assets/mos/032.png';
  String nameMonrass = 'Monrass';
  bool hasMonrass = false;
  String imageGorrass = 'assets/mos/033.png';
  String nameGorrass = 'Gorrass';
  bool hasGorrass = false;
  String imageFlamerock = 'assets/mos/034.png';
  String nameFlamerock = 'Flamerock';
  bool hasFlamerock = false;
  String imageFlameburst = 'assets/mos/035.png';
  String nameFlameburst = 'Flameburst';
  bool hasFlameburst = false;
  String imageVaseblade = 'assets/mos/036.png';
  String nameVaseblade = 'Vaseblade';
  bool hasVaseblade = false;
  String imageLeafblade = 'assets/mos/037.png';
  String nameLeafblade = 'Leafblade';
  bool hasLeafblade = false;
  String imageForestblade = 'assets/mos/038.png';
  String nameForestblade = 'Forestblade';
  bool hasForestblade = false;
  String imageGlimmer = 'assets/mos/039.png';
  String nameGlimmer = 'Glimmer';
  bool hasGlimmer = false;
  String imageSchimmer = 'assets/mos/040.png';
  String nameSchimmer = 'Schimmer';
  bool hasSchimmer = false;
  String imageDunebelle = 'assets/mos/041.png';
  String nameDunebelle = 'Dunebelle';
  bool hasDunebelle = false;
  String imageInfernus = 'assets/mos/042.png';
  String nameInfernus = 'Infernus';
  bool hasInfernus = false;
  String imageBlazenus = 'assets/mos/043.png';
  String nameBlazenus = 'Blazenus';
  bool hasBlazenus = false;
  String imageWhispurr = 'assets/mos/044.png';
  String nameWhispurr = 'Whispurr';
  bool hasWhispurr = false;
  String imageGhosteroid = 'assets/mos/045.png';
  String nameGhosteroid = 'Ghosteroid';
  bool hasGhosteroid = false;
  String imageToxibug = 'assets/mos/046.png';
  String nameToxibug = 'Toxibug';
  bool hasToxibug = false;
  String imageToxiban = 'assets/mos/047.png';
  String nameToxiban = 'Toxiban';
  bool hasToxiban = false;
  String imageCitrusclaw = 'assets/mos/048.png';
  String nameCitrusclaw = 'Citrusclaw';
  bool hasCitrusclaw = false;
  String imageGingerpaw = 'assets/mos/049.png';
  String nameGingerpaw = 'Gingerpaw';
  bool hasGingerpaw = false;
  String imagePoliba = 'assets/mos/050.png';
  String namePoliba = 'Poliba';
  bool hasPoliba = false;
  String imageSkov = 'assets/mos/051.png';
  String nameSkov = 'Skov';
  bool hasSkov = false;
  String imageSkovie = 'assets/mos/052.png';
  String nameSkovie = 'Skovie';
  bool hasSkovie = false;
  String imageRhinohorn = 'assets/mos/053.png';
  String nameRhinohorn = 'Rhinohorn';
  bool hasRhinohorn = false;
  String imageRhinorock = 'assets/mos/054.png';
  String nameRhinorock = 'Rhinorock';
  bool hasRhinorock = false;
  String imageSeebreeze = 'assets/mos/055.png';
  String nameSeebreeze = 'Seebreeze';
  bool hasSeebreeze = false;
  String imageSeastorm = 'assets/mos/056.png';
  String nameSeastorm = 'Seastorm';
  bool hasSeastorm = false;
  String imageFlamie = 'assets/mos/057.png';
  String nameFlamie = 'Flamie';
  bool hasFlamie = false;
  String imageFlabie = 'assets/mos/058.png';
  String nameFlabie = 'Flabie';
  bool hasFlabie = false;
  String imageFeliphys = 'assets/mos/059.png';
  String nameFeliphys = 'Feliphys';
  bool hasFeliphys = false;
  String imageMindlion = 'assets/mos/060.png';
  String nameMindlion = 'Mindlion';
  bool hasMindlion = false;
  String imageDracotide = 'assets/mos/061.png';
  String nameDracotide = 'Dracotide';
  bool hasDracotide = false;
  String imageDracoflow = 'assets/mos/062.png';
  String nameDracoflow = 'Dracoflow';
  bool hasDracoflow = false;
  String imageFrostbite = 'assets/mos/063.png';
  String nameFrostbite = 'Frostbite';
  bool hasFrostbite = false;
  String imageFrostitoes = 'assets/mos/064.png';
  String nameFrostitoes = 'Frostitoes';
  bool hasFrostitoes = false;
  String imageMinei = 'assets/mos/065.png';
  String nameMinei = 'Minei';
  bool hasMinei = false;
  String imageMinerax = 'assets/mos/066.png';
  String nameMinerax = 'Minerax';
  bool hasMinerax = false;
  String imageFluffernut = 'assets/mos/067.png';
  String nameFluffernut = 'Fluffernut';
  bool hasFluffernut = false;
  String imageRazorleaf = 'assets/mos/068.png';
  String nameRazorleaf = 'Razorleaf';
  bool hasRazorleaf = false;
  String imageSpork = 'assets/mos/069.png';
  String nameSpork = 'Spork';
  bool hasSpork = false;
  String imageSporkle = 'assets/mos/070.png';
  String nameSporkle = 'Sporkle';
  bool hasSporkle = false;
  String imageZazzle = 'assets/mos/071.png';
  String nameZazzle = 'Zazzle';
  bool hasZazzle = false;
  String imageChiliwrath = 'assets/mos/072.png';
  String nameChiliwrath = 'Chiliwrath';
  bool hasChiliwrath = false;
  String imageChiliclaw = 'assets/mos/073.png';
  String nameChiliclaw = 'Chiliclaw';
  bool hasChiliclaw = false;
  String imageDoldog = 'assets/mos/074.png';
  String nameDoldog = 'Doldog';
  bool hasDoldog = false;
  String imageRoseburst = 'assets/mos/075.png';
  String nameRoseburst = 'Roseburst';
  bool hasRoseburst = false;
  String imageFlowerburst = 'assets/mos/076.png';
  String nameFlowerburst = 'Flowerburst';
  bool hasFlowerburst = false;
  String imageFrostie = 'assets/mos/077.png';
  String nameFrostie = 'Frostie';
  bool hasFrostie = false;
  String imageFroster = 'assets/mos/078.png';
  String nameFroster = 'Froster';
  bool hasFroster = false;
  String imageDolie = 'assets/mos/079.png';
  String nameDolie = 'Dolie';
  bool hasDolie = false;
  String imageDolphie = 'assets/mos/080.png';
  String nameDolphie = 'Dolphie';
  bool hasDolphie = false;
  String imageFenr = 'assets/mos/081.png';
  String nameFenr = 'Fenr';
  bool hasFenr = false;
  String imageFenrago = 'assets/mos/082.png';
  String nameFenrago = 'Fenrago';
  bool hasFenrago = false;
  String imageMindwave = 'assets/mos/083.png';
  String nameMindwave = 'Mindwave';
  bool hasMindwave = false;
  String imagePsywave = 'assets/mos/084.png';
  String namePsywave = 'Psywave';
  bool hasPsywave = false;
  String imageBoolder = 'assets/mos/085.png';
  String nameBoolder = 'Boolder';
  bool hasBoolder = false;
  String imageBoolderback = 'assets/mos/086.png';
  String nameBoolderback = 'Boolderback';
  bool hasBoolderback = false;
  String imageAquazoid = 'assets/mos/087.png';
  String nameAquazoid = 'Aquazoid';
  bool hasAquazoid = false;
  String imageThunderstrike = 'assets/mos/088.png';
  String nameThunderstrike = 'Thunderstrike';
  bool hasThunderstrike = false;
  String imageBippitibop = 'assets/mos/089.png';
  String nameBippitibop = 'Bippitibop';
  bool hasBippitibop = false;
  String imageVenomous = 'assets/mos/090.png';
  String nameVenomous = 'Venomous';
  bool hasVenomous = false;
  String imagePsycodactyl = 'assets/mos/091.png';
  String namePsycodactyl = 'Psycodactyl';
  bool hasPsycodactyl = false;

  late var data;

  void getPokeData() async{

    var user = FirebaseAuth.instance.currentUser;
    data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      hasFlorass = data['florass'];
      hasSparkie = data['sparkie'];
      hasSparken = data['sparken'];
      hasAquadra = data['aquadra'];
      hasShockwing = data['shockwing'];
      hasZapwing = data['zapwing'];
      hasJoltur = data['joltur'];
      hasJoltrik = data['joltrik'];
      hasMysticon = data['mysticon'];
      hasPsypup = data['psypup'];
      hasPsydog = data['psydog'];
      hasDolphineon = data['dolphineon'];
      hasRockslide = data['rockslide'];
      hasRockfist = data['rockfist'];
      hasSilentpaw = data['silentpaw'];
      hasShadowclaw = data['shadowclaw'];
      hasElectromon = data['electromon'];
      hasEaglestorm = data['eaglestorm'];
      hasSkywing = data['skywing'];
      hasWoolie = data['woolie'];
      hasWooliec = data['wooliec'];
      hasWooliectra = data['wooliectra'];
      hasSpookums = data['spookums'];
      hasSpookram = data['spookram'];
      hasNimowl = data['nimowl'];
      hasWisowl = data['wisowl'];
      hasFliefox = data['fliefox'];
      hasFluffox = data['fluffox'];
      hasDrogie = data['drogie'];
      hasDrogice = data['drogice'];
      hasDrogrost = data['drogrost'];
      hasMonrass = data['monrass'];
      hasGorrass = data['gorrass'];
      hasFlamerock = data['flamerock'];
      hasFlameburst = data['flameburst'];
      hasVaseblade = data['vaseblade'];
      hasLeafblade = data['leafblade'];
      hasForestblade = data['forestblade'];
      hasGlimmer = data['glimmer'];
      hasSchimmer = data['schimmer'];
      hasDunebelle = data['dunebelle'];
      hasInfernus = data['infernus'];
      hasBlazenus = data['blazenus'];
      hasWhispurr = data['whispurr'];
      hasGhosteroid = data['ghosteroid'];
      hasToxibug = data['toxibug'];
      hasToxiban = data['toxiban'];
      hasCitrusclaw = data['citrusclaw'];
      hasGingerpaw = data['gingerpaw'];
      hasPoliba = data['poliba'];
      hasSkov = data['skov'];
      hasSkovie = data['skovie'];
      hasRhinohorn = data['rhinohorn'];
      hasRhinorock = data['rhinorock'];
      hasSeebreeze = data['seebreeze'];
      hasSeastorm = data['seastorm'];
      hasFlamie = data['flamie'];
      hasFlabie = data['flabie'];
      hasFeliphys = data['feliphys'];
      hasMindlion = data['mindlion'];
      hasDracotide = data['dracotide'];
      hasDracoflow = data['dracoflow'];
      hasFrostbite = data['frostbite'];
      hasFrostitoes = data['frostitoes'];
      hasMinei = data['minei'];
      hasMinerax = data['minerax'];
      hasFluffernut = data['fluffernut'];
      hasRazorleaf = data['razorleaf'];
      hasSpork = data['spork'];
      hasSporkle = data['sporkle'];
      hasZazzle = data['zazzle'];
      hasChiliwrath = data['chiliwrath'];
      hasChiliclaw = data['chiliclaw'];
      hasDoldog = data['doldog'];
      hasRoseburst = data['roseburst'];
      hasFlowerburst = data['flowerburst'];
      hasFrostie = data['frostie'];
      hasFroster = data['froster'];
      hasDolie = data['dolie'];
      hasDolphie = data['dolphie'];
      hasFenr = data['fenr'];
      hasFenrago = data['fenrago'];
      hasMindwave = data['mindwave'];
      hasPsywave = data['psywave'];
      hasBoolder = data['boolder'];
      hasBoolderback = data['boolderback'];
      hasAquazoid = data['aquazoid'];
      hasThunderstrike = data['thunderstrike'];
      hasBippitibop = data['bippitibop'];
      hasVenomous = data['venomous'];
      hasPsycodactyl = data['psycodactyl'];

    });
  }

  int candy10 = 10;
  int candy25 = 25;
  int candy50 = 50;
  int candy100 = 100;

  late int candy;

  void loadData() async {
    var user = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    setState(() {
      candy = data['candy'];
    });
  }

  void decreaseCandy(int candyNumber, String pokeName) async {
    var user = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    var newCandy = candy - candyNumber;
    if(candy<candyNumber){

    }else{
      setState(() {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'candy': newCandy});
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'${pokeName.toLowerCase()}': true});
      });

      setState(() {
        candy = newCandy;
      });
    }
  }

  final player = AudioPlayer();

  bool isPlaying = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    player.play(AssetSource('sounds/background2.mp3'));
    player.setReleaseMode(ReleaseMode.loop);
    isPlaying = true;

    loadData();
    getPokeData();

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      player.stop();
      isPlaying = false;
    } else if (state == AppLifecycleState.resumed) {
      if (!isPlaying) {
        player.resume();
        isPlaying = true;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    player.stop();
    // TODO: implement dispose
    super.dispose();
  }

  int hasCandy = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('shoppingpage'.tr, style: baslikStili,),
          centerTitle: true,
          backgroundColor: Colors.teal[400],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: (){
                              hasCandy=candy10;
                              if(hasFlorass==true){
                                alreadyBuy(context, nameFlorass);
                              }
                              else{
                                buy(context, nameFlorass, candy10);
                              }
                            },
                            child: myContainer(hasFlorass, imageFlorass,nameFlorass),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: (){
                              hasCandy = candy10;
                              if(hasSparkie==true){
                                alreadyBuy(context, nameSparkie);
                              }
                              else{
                                buy(context, nameSparkie, candy10);
                              }
                            },
                            child: myContainer(hasSparkie, imageSparkie, nameSparkie),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSparken==true){
                                  alreadyBuy(context, nameSparken);
                                }
                                else{
                                  buy(context, nameSparken, candy25);
                                }
                              },
                              child: myContainer(hasSparken, imageSparken,nameSparken)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasAquadra==true){
                                  alreadyBuy(context, nameAquadra);
                                }
                                else{
                                  buy(context, nameAquadra, candy10);
                                }
                              },
                              child: myContainer(hasAquadra, imageAquadra,nameAquadra)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasShockwing==true){
                                  alreadyBuy(context, nameShockwing);
                                }
                                else{
                                  buy(context, nameShockwing, candy10);
                                }
                              },
                              child: myContainer(hasShockwing, imageShockwing, nameShockwing)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasZapwing==true){
                                  alreadyBuy(context, nameZapwing);
                                }
                                else{
                                  buy(context, nameZapwing, candy25);
                                }
                              },
                              child: myContainer(hasZapwing, imageZapwing,nameZapwing)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasJoltur==true){
                                  alreadyBuy(context, nameJoltur);
                                }
                                else{
                                  buy(context, nameJoltur, candy10);
                                }
                              },
                              child: myContainer(hasJoltur, imageJoltur,nameJoltur)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasJoltrik==true){
                                  alreadyBuy(context, nameJoltrik);
                                }
                                else{
                                  buy(context, nameJoltrik, candy25);
                                }
                              },
                              child: myContainer(hasJoltrik, imageJoltrik, nameJoltrik)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasMysticon==true){
                                  alreadyBuy(context, nameMysticon);
                                }
                                else{
                                  buy(context, nameMysticon, candy10);
                                }
                              },
                              child: myContainer(hasMysticon, imageMysticon,nameMysticon)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasPsypup==true){
                                  alreadyBuy(context, namePsypup);
                                }
                                else{
                                  buy(context, namePsypup, candy10);
                                }
                              },
                              child: myContainer(hasPsypup, imagePsypup,namePsypup)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasPsydog==true){
                                  alreadyBuy(context, namePsydog);
                                }
                                else{
                                  buy(context, namePsydog, candy25);
                                }
                              },
                              child: myContainer(hasPsydog, imagePsydog, namePsydog)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDolphineon==true){
                                  alreadyBuy(context, nameDolphineon);
                                }
                                else{
                                  buy(context, nameDolphineon, candy10);
                                }
                              },
                              child: myContainer(hasDolphineon, imageDolphineon,nameDolphineon)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasRockslide==true){
                                  alreadyBuy(context, nameRockslide);
                                }
                                else{
                                  buy(context, nameRockslide, candy10);
                                }
                              },
                              child: myContainer(hasRockslide, imageRockslide,nameRockslide)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasRockfist==true){
                                  alreadyBuy(context, nameRockfist);
                                }
                                else{
                                  buy(context, nameRockfist, candy25);
                                }
                              },
                              child: myContainer(hasRockfist, imageRockfist, nameRockfist)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasSilentpaw==true){
                                  alreadyBuy(context, nameSilentpaw);
                                }
                                else{
                                  buy(context, nameSilentpaw, candy10);
                                }
                              },
                              child: myContainer(hasSilentpaw, imageSilentpaw,nameSilentpaw)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasShadowclaw==true){
                                  alreadyBuy(context, nameShadowclaw);
                                }
                                else{
                                  buy(context, nameShadowclaw, candy25);
                                }
                              },
                              child: myContainer(hasShadowclaw, imageShadowclaw,nameShadowclaw)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasElectromon==true){
                                  alreadyBuy(context, nameElectromon);
                                }
                                else{
                                  buy(context, nameElectromon, candy10);
                                }
                              },
                              child: myContainer(hasElectromon, imageElectromon, nameElectromon)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasEaglestorm==true){
                                  alreadyBuy(context, nameEaglestorm);
                                }
                                else{
                                  buy(context, nameEaglestorm, candy10);
                                }
                              },
                              child: myContainer(hasEaglestorm, imageEaglestorm,nameEaglestorm)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSkywing==true){
                                  alreadyBuy(context, nameSkywing);
                                }
                                else{
                                  buy(context, nameSkywing, candy25);
                                }
                              },
                              child: myContainer(hasSkywing, imageSkywing,nameSkywing)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasWoolie==true){
                                  alreadyBuy(context, nameWoolie);
                                }
                                else{
                                  buy(context, nameWoolie, candy10);
                                }
                              },
                              child: myContainer(hasWoolie, imageWoolie, nameWoolie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasWooliec==true){
                                  alreadyBuy(context, nameWooliec);
                                }
                                else{
                                  buy(context, nameWooliec, candy25);
                                }
                              },
                              child: myContainer(hasWooliec, imageWooliec,nameWooliec)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy50;
                                if(hasWooliectra==true){
                                  alreadyBuy(context, nameWooliectra);
                                }
                                else{
                                  buy(context, nameWooliectra, candy50);
                                }
                              },
                              child: myContainer(hasWooliectra, imageWooliectra,nameWooliectra)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasSpookums==true){
                                  alreadyBuy(context, nameSpookums);
                                }
                                else{
                                  buy(context, nameSpookums, candy10);
                                }
                              },
                              child: myContainer(hasSpookums, imageSpookums, nameSpookums)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSpookram==true){
                                  alreadyBuy(context, nameSpookram);
                                }
                                else{
                                  buy(context, nameSpookram, candy25);
                                }
                              },
                              child: myContainer(hasSpookram, imageSpookram,nameSpookram)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasNimowl==true){
                                  alreadyBuy(context, nameNimowl);
                                }
                                else{
                                  buy(context, nameNimowl, candy10);
                                }
                              },
                              child: myContainer(hasNimowl, imageNimowl,nameNimowl)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasWisowl==true){
                                  alreadyBuy(context, nameWisowl);
                                }
                                else{
                                  buy(context, nameWisowl, candy25);
                                }
                              },
                              child: myContainer(hasWisowl, imageWisowl, nameWisowl)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFliefox==true){
                                  alreadyBuy(context, nameFliefox);
                                }
                                else{
                                  buy(context, nameFliefox, candy10);
                                }
                              },
                              child: myContainer(hasFliefox, imageFliefox,nameFliefox)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFluffox==true){
                                  alreadyBuy(context, nameFluffox);
                                }
                                else{
                                  buy(context, nameFluffox, candy25);
                                }
                              },
                              child: myContainer(hasFluffox, imageFluffox,nameFluffox)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDrogie==true){
                                  alreadyBuy(context, nameDrogie);
                                }
                                else{
                                  buy(context, nameDrogie, candy10);
                                }
                              },
                              child: myContainer(hasDrogie, imageDrogie, nameDrogie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasDrogice==true){
                                  alreadyBuy(context, nameDrogice);
                                }
                                else{
                                  buy(context, nameDrogice, candy25);
                                }
                              },
                              child: myContainer(hasDrogice, imageDrogice,nameDrogice)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy50;
                                if(hasDrogrost==true){
                                  alreadyBuy(context, nameDrogrost);
                                }
                                else{
                                  buy(context, nameDrogrost, candy50);
                                }
                              },
                              child: myContainer(hasDrogrost, imageDrogrost,nameDrogrost)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasMonrass==true){
                                  alreadyBuy(context, nameMonrass);
                                }
                                else{
                                  buy(context, nameMonrass, candy10);
                                }
                              },
                              child: myContainer(hasMonrass, imageMonrass, nameMonrass)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasGorrass==true){
                                  alreadyBuy(context, nameGorrass);
                                }
                                else{
                                  buy(context, nameGorrass, candy25);
                                }
                              },
                              child: myContainer(hasGorrass, imageGorrass,nameGorrass)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFlamerock==true){
                                  alreadyBuy(context, nameFlamerock);
                                }
                                else{
                                  buy(context, nameFlamerock, candy10);
                                }
                              },
                              child: myContainer(hasFlamerock, imageFlamerock,nameFlamerock)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFlameburst==true){
                                  alreadyBuy(context, nameFlameburst);
                                }
                                else{
                                  buy(context, nameFlameburst, candy25);
                                }
                              },
                              child: myContainer(hasFlameburst, imageFlameburst, nameFlameburst)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasVaseblade==true){
                                  alreadyBuy(context, nameVaseblade);
                                }
                                else{
                                  buy(context, nameVaseblade, candy10);
                                }
                              },
                              child: myContainer(hasVaseblade, imageVaseblade,nameVaseblade)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasLeafblade==true){
                                  alreadyBuy(context, nameLeafblade);
                                }
                                else{
                                  buy(context, nameLeafblade, candy25);
                                }
                              },
                              child: myContainer(hasLeafblade, imageLeafblade,nameLeafblade)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy50;
                                if(hasForestblade==true){
                                  alreadyBuy(context, nameForestblade);
                                }
                                else{
                                  buy(context, nameForestblade, candy50);
                                }
                              },
                              child: myContainer(hasForestblade, imageForestblade, nameForestblade)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasGlimmer==true){
                                  alreadyBuy(context, nameGlimmer);
                                }
                                else{
                                  buy(context, nameGlimmer, candy10);
                                }
                              },
                              child: myContainer(hasGlimmer, imageGlimmer,nameGlimmer)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSchimmer==true){
                                  alreadyBuy(context, nameSchimmer);
                                }
                                else{
                                  buy(context, nameSchimmer, candy25);
                                }
                              },
                              child: myContainer(hasSchimmer, imageSchimmer,nameSchimmer)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDunebelle==true){
                                  alreadyBuy(context, nameDunebelle);
                                }
                                else{
                                  buy(context, nameDunebelle, candy10);
                                }
                              },
                              child: myContainer(hasDunebelle, imageDunebelle, nameDunebelle)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasInfernus==true){
                                  alreadyBuy(context, nameInfernus);
                                }
                                else{
                                  buy(context, nameInfernus, candy10);
                                }
                              },
                              child: myContainer(hasInfernus, imageInfernus,nameInfernus)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasBlazenus==true){
                                  alreadyBuy(context, nameBlazenus);
                                }
                                else{
                                  buy(context, nameBlazenus, candy25);
                                }
                              },
                              child: myContainer(hasBlazenus, imageBlazenus,nameBlazenus)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasWhispurr==true){
                                  alreadyBuy(context, nameWhispurr);
                                }
                                else{
                                  buy(context, nameWhispurr, candy10);
                                }
                              },
                              child: myContainer(hasWhispurr, imageWhispurr, nameWhispurr)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasGhosteroid==true){
                                  alreadyBuy(context, nameGhosteroid);
                                }
                                else{
                                  buy(context, nameGhosteroid, candy25);
                                }
                              },
                              child: myContainer(hasGhosteroid, imageGhosteroid,nameGhosteroid)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasToxibug==true){
                                  alreadyBuy(context, nameToxibug);
                                }
                                else{
                                  buy(context, nameToxibug, candy10);
                                }
                              },
                              child: myContainer(hasToxibug, imageToxibug,nameToxibug)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasToxiban==true){
                                  alreadyBuy(context, nameToxiban);
                                }
                                else{
                                  buy(context, nameToxiban, candy25);
                                }
                              },
                              child: myContainer(hasToxiban, imageToxiban, nameToxiban)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasCitrusclaw==true){
                                  alreadyBuy(context, nameCitrusclaw);
                                }
                                else{
                                  buy(context, nameCitrusclaw, candy10);
                                }
                              },
                              child: myContainer(hasCitrusclaw, imageCitrusclaw,nameCitrusclaw)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasGingerpaw==true){
                                  alreadyBuy(context, nameGingerpaw);
                                }
                                else{
                                  buy(context, nameGingerpaw, candy25);
                                }
                              },
                              child: myContainer(hasGingerpaw, imageGingerpaw,nameGingerpaw)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasPoliba==true){
                                  alreadyBuy(context, namePoliba);
                                }
                                else{
                                  buy(context, namePoliba, candy10);
                                }
                              },
                              child: myContainer(hasPoliba, imagePoliba, namePoliba)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasSkov==true){
                                  alreadyBuy(context, nameSkov);
                                }
                                else{
                                  buy(context, nameSkov, candy10);
                                }
                              },
                              child: myContainer(hasSkov, imageSkov,nameSkov)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSkovie==true){
                                  alreadyBuy(context, nameSkovie);
                                }
                                else{
                                  buy(context, nameSkovie, candy25);
                                }
                              },
                              child: myContainer(hasSkovie, imageSkovie,nameSkovie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasRhinohorn==true){
                                  alreadyBuy(context, nameRhinohorn);
                                }
                                else{
                                  buy(context, nameRhinohorn, candy10);
                                }
                              },
                              child: myContainer(hasRhinohorn, imageRhinohorn, nameRhinohorn)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasRhinorock==true){
                                  alreadyBuy(context, nameRhinorock);
                                }
                                else{
                                  buy(context, nameRhinorock, candy25);
                                }
                              },
                              child: myContainer(hasRhinorock, imageRhinorock,nameRhinorock)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasSeebreeze==true){
                                  alreadyBuy(context, nameSeebreeze);
                                }
                                else{
                                  buy(context, nameSeebreeze, candy10);
                                }
                              },
                              child: myContainer(hasSeebreeze, imageSeebreeze,nameSeebreeze)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSeastorm==true){
                                  alreadyBuy(context, nameSeastorm);
                                }
                                else{
                                  buy(context, nameSeastorm, candy25);
                                }
                              },
                              child: myContainer(hasSeastorm, imageSeastorm, nameSeastorm)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFlamie==true){
                                  alreadyBuy(context, nameFlamie);
                                }
                                else{
                                  buy(context, nameFlamie, candy10);
                                }
                              },
                              child: myContainer(hasFlamie, imageFlamie,nameFlamie)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFlabie==true){
                                  alreadyBuy(context, nameFlabie);
                                }
                                else{
                                  buy(context, nameFlabie, candy25);
                                }
                              },
                              child: myContainer(hasFlabie, imageFlabie,nameFlabie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFeliphys==true){
                                  alreadyBuy(context, nameFeliphys);
                                }
                                else{
                                  buy(context, nameFeliphys, candy10);
                                }
                              },
                              child: myContainer(hasFeliphys, imageFeliphys, nameFeliphys)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasMindlion==true){
                                  alreadyBuy(context, nameMindlion);
                                }
                                else{
                                  buy(context, nameMindlion, candy25);
                                }
                              },
                              child: myContainer(hasMindlion, imageMindlion,nameMindlion)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDracotide==true){
                                  alreadyBuy(context, nameDracotide);
                                }
                                else{
                                  buy(context, nameDracotide, candy10);
                                }
                              },
                              child: myContainer(hasDracotide, imageDracotide,nameDracotide)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasDracoflow==true){
                                  alreadyBuy(context, nameDracoflow);
                                }
                                else{
                                  buy(context, nameDracoflow, candy25);
                                }
                              },
                              child: myContainer(hasDracoflow, imageDracoflow, nameDracoflow)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFrostbite==true){
                                  alreadyBuy(context, nameFrostbite);
                                }
                                else{
                                  buy(context, nameFrostbite, candy10);
                                }
                              },
                              child: myContainer(hasFrostbite, imageFrostbite,nameFrostbite)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFrostitoes==true){
                                  alreadyBuy(context, nameFrostitoes);
                                }
                                else{
                                  buy(context, nameFrostitoes, candy25);
                                }
                              },
                              child: myContainer(hasFrostitoes, imageFrostitoes,nameFrostitoes)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasMinei==true){
                                  alreadyBuy(context, nameMinei);
                                }
                                else{
                                  buy(context, nameMinei, candy10);
                                }
                              },
                              child: myContainer(hasMinei, imageMinei, nameMinei)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasMinerax==true){
                                  alreadyBuy(context, nameMinerax);
                                }
                                else{
                                  buy(context, nameMinerax, candy25);
                                }
                              },
                              child: myContainer(hasMinerax, imageMinerax,nameMinerax)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFluffernut==true){
                                  alreadyBuy(context, nameFluffernut);
                                }
                                else{
                                  buy(context, nameFluffernut, candy10);
                                }
                              },
                              child: myContainer(hasFluffernut, imageFluffernut,nameFluffernut)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child:  GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasRazorleaf==true){
                                  alreadyBuy(context, nameRazorleaf);
                                }
                                else{
                                  buy(context, nameRazorleaf, candy25);
                                }
                              },
                              child: myContainer(hasRazorleaf, imageRazorleaf, nameRazorleaf)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasSpork==true){
                                  alreadyBuy(context, nameSpork);
                                }
                                else{
                                  buy(context, nameSpork, candy10);
                                }
                              },
                              child: myContainer(hasSpork, imageSpork,nameSpork)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasSporkle==true){
                                  alreadyBuy(context, nameSporkle);
                                }
                                else{
                                  buy(context, nameSporkle, candy25);
                                }
                              },
                              child: myContainer(hasSporkle, imageSporkle,nameSporkle)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy50;
                                if(hasZazzle==true){
                                  alreadyBuy(context, nameZazzle);
                                }
                                else{
                                  buy(context, nameZazzle, candy50);
                                }
                              },
                              child: myContainer(hasZazzle, imageZazzle, nameZazzle)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasChiliwrath==true){
                                  alreadyBuy(context, nameChiliwrath);
                                }
                                else{
                                  buy(context, nameChiliwrath, candy10);
                                }
                              },
                              child: myContainer(hasChiliwrath, imageChiliwrath,nameChiliwrath)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasChiliclaw==true){
                                  alreadyBuy(context, nameChiliclaw);
                                }
                                else{
                                  buy(context, nameChiliclaw, candy25);
                                }
                              },
                              child: myContainer(hasChiliclaw, imageChiliclaw,nameChiliclaw)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDoldog==true){
                                  alreadyBuy(context, nameDoldog);
                                }
                                else{
                                  buy(context, nameDoldog, candy10);
                                }
                              },
                              child: myContainer(hasDoldog, imageDoldog, nameDoldog)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasRoseburst==true){
                                  alreadyBuy(context, nameRoseburst);
                                }
                                else{
                                  buy(context, nameRoseburst, candy10);
                                }
                              },
                              child: myContainer(hasRoseburst, imageRoseburst,nameRoseburst)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFlowerburst==true){
                                  alreadyBuy(context, nameFlowerburst);
                                }
                                else{
                                  buy(context, nameFlowerburst, candy25);
                                }
                              },
                              child: myContainer(hasFlowerburst, imageFlowerburst,nameFlowerburst)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFrostie==true){
                                  alreadyBuy(context, nameFrostie);
                                }
                                else{
                                  buy(context, nameFrostie, candy10);
                                }
                              },
                              child: myContainer(hasFrostie, imageFrostie, nameFrostie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFroster==true){
                                  alreadyBuy(context, nameFroster);
                                }
                                else{
                                  buy(context, nameFroster, candy25);
                                }
                              },
                              child: myContainer(hasFroster, imageFroster,nameFroster)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasDolie==true){
                                  alreadyBuy(context, nameDolie);
                                }
                                else{
                                  buy(context, nameDolie, candy10);
                                }
                              },
                              child: myContainer(hasDolie, imageDolie,nameDolie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasDolphie==true){
                                  alreadyBuy(context, nameDolphie);
                                }
                                else{
                                  buy(context, nameDolphie, candy25);
                                }
                              },
                              child: myContainer(hasDolphie, imageDolphie, nameDolphie)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasFenr==true){
                                  alreadyBuy(context, nameFenr);
                                }
                                else{
                                  buy(context, nameFenr, candy10);
                                }
                              },
                              child: myContainer(hasFenr, imageFenr,nameFenr)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasFenrago==true){
                                  alreadyBuy(context, nameFenrago);
                                }
                                else{
                                  buy(context, nameFenrago, candy25);
                                }
                              },
                              child: myContainer(hasFenrago, imageFenrago,nameFenrago)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasMindwave==true){
                                  alreadyBuy(context, nameMindwave);
                                }
                                else{
                                  buy(context, nameMindwave, candy10);
                                }
                              },
                              child: myContainer(hasMindwave, imageMindwave, nameMindwave)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasPsywave==true){
                                  alreadyBuy(context, namePsywave);
                                }
                                else{
                                  buy(context, namePsywave, candy25);
                                }
                              },
                              child: myContainer(hasPsywave, imagePsywave,namePsywave)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasBoolder==true){
                                  alreadyBuy(context, nameBoolder);
                                }
                                else{
                                  buy(context, nameBoolder, candy10);
                                }
                              },
                              child: myContainer(hasBoolder, imageBoolder,nameBoolder)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy25;
                                if(hasBoolderback==true){
                                  alreadyBuy(context, nameBoolderback);
                                }
                                else{
                                  buy(context, nameBoolderback, candy25);
                                }
                              },
                              child: myContainer(hasBoolderback, imageBoolderback, nameBoolderback)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasAquazoid==true){
                                  alreadyBuy(context, nameAquazoid);
                                }
                                else{
                                  buy(context, nameAquazoid, candy10);
                                }
                              },
                              child: myContainer(hasAquazoid, imageAquazoid,nameAquazoid)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy100;
                                if(hasThunderstrike==true){
                                  alreadyBuy(context, nameThunderstrike);
                                }
                                else{
                                  buy(context, nameThunderstrike, candy100);
                                }
                              },
                              child: myContainer(hasThunderstrike, imageThunderstrike,nameThunderstrike)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasBippitibop==true){
                                  alreadyBuy(context, nameBippitibop);
                                }
                                else{
                                  buy(context, nameBippitibop, candy10);
                                }
                              },
                              child: myContainer(hasBippitibop, imageBippitibop, nameBippitibop)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy10;
                                if(hasVenomous==true){
                                  alreadyBuy(context, nameVenomous);
                                }
                                else{
                                  buy(context, nameVenomous, candy10);
                                }
                              },
                              child: myContainer(hasVenomous, imageVenomous,nameVenomous)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: GestureDetector(
                              onTap: (){
                                hasCandy = candy100;
                                if(hasPsycodactyl==true){
                                  alreadyBuy(context, namePsycodactyl);
                                }
                                else{
                                  buy(context, namePsycodactyl, candy100);
                                }
                              },
                              child: myContainer(hasPsycodactyl, imagePsycodactyl,namePsycodactyl)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Alert dialog'u göstermek için kullanılacak olan method.
  void alreadyBuy(BuildContext context, String pokeName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[100],
          title: Text("error".tr),
          content: Text("${pokeName}. " + "alreadybuyed".tr),
          actions: <Widget>[
            TextButton(
              child: Text("okay".tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<void> buy(BuildContext context, String pokeName, int pokeCandy) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[100],
          title: Text('$pokeName <----> $pokeCandy candy'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('monsterbuy'.tr),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cancel'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('buy'.tr),
              onPressed: () {
                if(candy>=hasCandy){
                  successDialog(context);
                  decreaseCandy(hasCandy, pokeName);
                }
                else if(candy<hasCandy){
                  unsuccessDialog(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void successDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[100],
          title: Text("succesful".tr),
          content: Text('succesfulbuy'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('okay'.tr),
            ),
          ],
        );
      },
    );
  }

  void unsuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[100],
          title: Text("unsuccesful".tr),
          content: Text('unsuccesfulbuy'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('okay'.tr),
            ),
          ],
        );
      },
    );
  }

  Container myContainer(bool hasImage, String imagePath, String imageName) {
    return Container(
      child: hasImage
          ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageBuild(imagePath),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(imageName),
                  shopIcon(hasImage),
                ],
              ),
            ],
          )
          : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageBuild(imagePath),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(imageName),
                  shopIcon(hasImage),
                ],
              ),
            ],
          ),
    );
  }

  Image imageBuild(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );
  }

  Widget shopIcon(bool isOpen) {
    if (isOpen) {
      return Icon(Icons.check, color: Colors.green,);
    } else {
      return Icon(Icons.close, color: Colors.red,);
    }
  }
}