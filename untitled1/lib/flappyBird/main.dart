import 'package:untitled1/flappyBird/audio_helper.dart';
import 'package:untitled1/flappyBird/bloc/game/game_cubit.dart';
import 'package:untitled1/flappyBird/main_page.dart';
import 'package:untitled1/flappyBird/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class flappyStart extends StatelessWidget {
  const flappyStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GameCubit(
        getIt.get<AudioHelper>(),
      ),
      child: MaterialApp(
        title: 'Flappy Dash',
        theme: ThemeData(fontFamily: 'Chewy'),
        home: const MainPage(),
      ),
    );
  }
}


