import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled1/flappyBird/audio_helper.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(
      this._audioHelper,
      ) : super(const GameState());

  final AudioHelper _audioHelper;

  void startPlaying() {
    _audioHelper.playBackgroundAudio();
    emit(state.copyWith(
      currentPlayingState: PlayingState.playing,
      currentScore: 0,
    ));
  }

  void increaseScore() {
    _audioHelper.playScoreCollectSound();
    emit(state.copyWith(
      currentScore: state.currentScore + 1,
    ));
  }

  void gameOver() {
    _audioHelper.stopBackgroundAudio();
    emit(state.copyWith(
      currentPlayingState: PlayingState.gameOver,
    ));
  }

  void restartGame() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.idle,
      currentScore: 0,
    ));
  }
}