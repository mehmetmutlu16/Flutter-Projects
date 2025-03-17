import 'package:untitled1/wordle/providers/controller.dart';
import 'package:untitled1/wordle/providers/theme_provider.dart';
import 'package:untitled1/wordle/utils/theme_preferences.dart';
import 'package:untitled1/wordle/utils/themes.dart';

import './pages/wordleHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wordle extends StatelessWidget {
  const Wordle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
        child: FutureBuilder(
        initialData: false,
        future: ThemePreferences.getTheme(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            WidgetsBinding.instance.addPostFrameCallback((timeStamp){
              Provider.of<ThemeProvider>(context, listen: false).setTheme(turnOn: snapshot.data as bool);
            });
          }
          return Consumer<ThemeProvider>(
          builder: (_, notifier, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Wordle',
            theme: notifier.isDark ? darkTheme : lightTheme,
            home: const wordleHomePage(),
          ),
        );
        },
      ),
    );
  }
}


