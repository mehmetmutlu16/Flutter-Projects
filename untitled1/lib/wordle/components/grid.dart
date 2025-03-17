import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/wordle/components/tile.dart';

import '../animations/bounce.dart';
import '../animations/dance.dart';
import '../providers/controller.dart';

class Grid extends StatelessWidget {
  const Grid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(36, 20, 36, 20),
      itemCount: 25,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        crossAxisCount: 5,
      ),
      itemBuilder: (context, index){
        return Consumer<Controller>(
          builder: (_, notifier, __) {
            bool animate = false;
            bool animateDance = false;
            int danceDelay = 1600;
            if (index == (notifier.currentTile - 1) &&
                !notifier.isBackOrEnter) {
              animate = true;
            }
            if (notifier.gameWon) {
              for (int i = notifier.tilesEntered.length - 5;
              i < notifier.tilesEntered.length;
              i++) {
                if (index == i) {
                  animateDance = true;
                  danceDelay += 150 * (i - ((notifier.currentRow - 1) * 5));
                }
              }
            }
            return Dance(
              delay: danceDelay,
              animate: animateDance,
              child: Bounce(
                  animate: animate,
                  child: Tile(
                    index: index,
                  )),
            );
          },
        );
      },
    );
  }
}

