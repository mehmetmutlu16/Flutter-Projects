import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flamedeneme/game/routes/gameplay.dart';
import 'package:flamedeneme/game/routes/pause_menu.dart';
import 'package:flutter/widgets.dart' hide Route, OverlayRoute;
import 'package:flamedeneme/game/routes/level_selection.dart';
import 'package:flamedeneme/game/routes/main_menu.dart';
import 'package:flamedeneme/game/routes/settings.dart';
//import 'package:flame_tiled/flame_tiled.dart';

class SkiMasterGame extends FlameGame with HasKeyboardHandlerComponents{

  final musicValueNotifier = ValueNotifier(true);
  final sfxValueNotifier = ValueNotifier(true);

  late final _routes = <String, Route>{
    MainMenu.id: OverlayRoute(
      (context, game) => MainMenu(
        onPlayPressed: () => _routeById(LevelSelection.id),
        onSettingsPressed: () => _routeById(Settings.id),
      )
    ),
    Settings.id: OverlayRoute(
      (context, game) => Settings(
        musicValueListenable: musicValueNotifier,
        sfxValueListenable: sfxValueNotifier,
        onMusicValueChanged: (value) => musicValueNotifier.value = value,
        onSfxValueChanged: (value) => sfxValueNotifier.value = value,
        onBackPressed: _popRoute,
      ),
    ),
    LevelSelection.id: OverlayRoute(
      (context, game) => LevelSelection(
        onLevelSelected: _startLevel,
        onBackPressed: _popRoute,
      )
    ),
    PauseMenu.id: OverlayRoute(
      (context, game) => PauseMenu()
    ),
  };

  late final _router = RouterComponent(
      initialRoute: MainMenu.id,
      routes: _routes,
  );

  @override
  FutureOr<void> onLoad() async{
    await add(_router);
  }

  void _routeById(String id){
    _router.pushNamed(id);
  }

  void _popRoute(){
    _router.pop();
  }

  void _startLevel(int levelIndex){
    _router.pop();
    _router.pushReplacement(
      Route(
        () => Gameplay(
          levelIndex,
          onPausePressed: _pauseGame,
        ),
      ),
      name: Gameplay.id,
    );
  }

  void _pauseGame(){
    _router.pushNamed(PauseMenu.id);
    pauseEngine();
  }
}