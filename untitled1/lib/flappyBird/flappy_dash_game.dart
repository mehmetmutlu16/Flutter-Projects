import 'package:untitled1/flappyBird/audio_helper.dart';
import 'package:untitled1/flappyBird/bloc/game/game_cubit.dart';
import 'package:untitled1/flappyBird/service_locator.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/widgets.dart';

import 'component/flappy_dash_root_component.dart';

class FlappyDashGame extends FlameGame<FlappyDashWorld> with HasCollisionDetection{
  FlappyDashGame(this.gameCubit)
      : super(
    world: FlappyDashWorld(),
    camera: CameraComponent.withFixedResolution(
      width: 600,
      height: 1300,
    ),
  );

  final GameCubit gameCubit;

}

class FlappyDashWorld extends World with TapCallbacks, HasGameRef<FlappyDashGame>, WidgetsBindingObserver {

  late FlappyDashRootComponent _rootComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await getIt.get<AudioHelper>().initialize();
    add(FlameBlocProvider<GameCubit, GameState>(
      create: () => game.gameCubit,
      children: [
        _rootComponent = FlappyDashRootComponent(),
      ],
    ));

    WidgetsBinding.instance.addObserver(this); // Observer'ı ekle
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _rootComponent.onTapDown(event);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      getIt.get<AudioHelper>().stopBackgroundAudio();
    } else if (state == AppLifecycleState.resumed) {
      getIt.get<AudioHelper>().playBackgroundAudio();
    }
  }

  @override
  void onRemove() {
    WidgetsBinding.instance.removeObserver(this);
    super.onRemove();
  }
}