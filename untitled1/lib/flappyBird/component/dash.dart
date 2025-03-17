import 'package:untitled1/flappyBird/bloc/game/game_cubit.dart';
import 'package:untitled1/flappyBird/component/hidden_coin.dart';
import 'package:untitled1/flappyBird/component/pipe.dart';
import 'package:untitled1/flappyBird/flappy_dash_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';

class Dash extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyDashGame>, FlameBlocReader<GameCubit, GameState> {
  Dash()
      : super(
    size: Vector2.all(80.0),
    anchor: Anchor.center,
    priority: 10,
  );

  final Vector2 _gravity = Vector2(0, 1400.0);
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, -500);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Sprite Animation yükleme
    animation = await gameRef.loadSpriteAnimation(
      'spritesheet.png',
      SpriteAnimationData.sequenced(
        amount: 2, // Sprite sheet'teki kare sayısı
        textureSize: Vector2(500, 500), // Her bir karenin boyutu
        stepTime: 0.1, // Her bir karenin ekranda kalma süresi (saniye)
        loop: true, // Animasyonun sürekli tekrar etmesi
      ),
    );

    // Çarpışma kutusu ekleme
    final radius = size.x / 2;
    final center = size / 2;
    add(CircleHitbox(
      radius: radius * 0.75,
      position: center * 1.1,
      anchor: Anchor.center,
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!bloc.state.currentPlayingState.isPlaying) {
      return;
    }
    _velocity += _gravity * dt;
    position += _velocity * dt;
  }

  void jump() {
    if (!bloc.state.currentPlayingState.isPlaying) {
      return;
    }
    _velocity = _jumpForce;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (!bloc.state.currentPlayingState.isPlaying) {
      return;
    }
    if (other is HiddenCoin) {
      bloc.increaseScore();
      other.removeFromParent();
    } else if (other is Pipe) {
      bloc.gameOver();
    }
  }
}
