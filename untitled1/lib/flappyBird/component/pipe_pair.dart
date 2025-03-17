import 'package:untitled1/flappyBird/bloc/game/game_cubit.dart';
import 'package:untitled1/flappyBird/component/hidden_coin.dart';
import 'package:untitled1/flappyBird/component/pipe.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

class PipePair extends PositionComponent with FlameBlocReader<GameCubit, GameState>{
  PipePair({
    required super.position,
    this.gap = 200.0,
    this.speed = 200.0,
  });

  final double gap;
  final double speed;

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    addAll([
      Pipe(
        isFlipped: false,
        position: Vector2(0, gap / 2),
      ),
      Pipe(
        isFlipped: true,
        position: Vector2(0, -(gap / 2))
      ),
      HiddenCoin(
        position: Vector2(30, 0),
      ),
    ]);
  }

  @override
  void update(double dt) {
    switch(bloc.state.currentPlayingState){
      case PlayingState.gameOver:
      case PlayingState.idle:
        break;
      case PlayingState.paused:
      case PlayingState.playing:
        position.x -= speed * dt;
        break;
    }
    super.update(dt);
  }

}