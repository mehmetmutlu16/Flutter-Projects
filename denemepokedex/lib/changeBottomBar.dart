import 'package:flutter/material.dart';
import 'package:pokedex/bigFight/chooseWarrior.dart';
import 'package:pokedex/homePage.dart';
import 'package:pokedex/profile.dart';
import 'package:pokedex/shopPage.dart';
import 'package:pokedex/bigFight/war.dart';

import 'collection/collectionPage.dart';
import 'gameChoose.dart';

List<Widget> liste = [
  homePage(),
  gameChoose(),
  shopPage(),
  chooseWarrior(),
  collectionPage(),
  profile(),
];