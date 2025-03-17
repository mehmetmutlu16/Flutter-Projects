import 'package:untitled1/flappyBird/bloc/game/game_cubit.dart';
import 'package:untitled1/flappyBird/flappy_dash_game.dart';
import 'package:untitled1/flappyBird/widgets/game_over_widget.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyDashGame _flappyDashGame;

  late GameCubit gameCubit;
  PlayingState? _latestState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyDashGame = FlappyDashGame(gameCubit);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state){
        if(state.currentPlayingState == PlayingState.idle && _latestState == PlayingState.gameOver){
          setState(() {
            _flappyDashGame = FlappyDashGame(gameCubit);
          });
        }
        _latestState = state.currentPlayingState;
      },
      builder: (context, state) {
        return Scaffold(
        body: Stack(
          children: [
            GameWidget(game: _flappyDashGame),
            if(state.currentPlayingState.isGameOver)
              const GameOverWidget(),
            if(state.currentPlayingState.isIdle)
              Align(
                alignment: const Alignment(0, 0.2),
                child: IgnorePointer(
                  child: const Text(
                    'TAP TO PLAY',
                    style: TextStyle(color: Color(0xFF2387FC), fontSize: 38, fontWeight: FontWeight.bold, letterSpacing: 4),
                  )
                    .animate(
                      onPlay: (controller) => controller.repeat(
                        reverse: true
                      ),
                    )
                    .scale(
                      begin: const Offset(1.0, 1.0),
                      end: const Offset(1.2, 1.2),
                      duration: const Duration(milliseconds: 500)
                  ),
                )
              ),
            if(!state.currentPlayingState.isGameOver)
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    state.currentScore.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 38
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
      },
    );
  }
}

