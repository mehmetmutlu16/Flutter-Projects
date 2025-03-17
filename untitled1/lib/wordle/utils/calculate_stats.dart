
import 'package:shared_preferences/shared_preferences.dart';

calculateStats({required bool gameWon}) async{
  int gamesPlayed = 0, gamesWon = 0, winPercetage = 0, currentStreak = 0, maxStreak = 0;

  final stats = await getStats();
  if(stats != null){
    gamesPlayed = int.parse(stats[0]);
    gamesWon = int.parse(stats[1]);
    winPercetage = int.parse(stats[2]);
    currentStreak = int.parse(stats[3]);
    maxStreak = int.parse(stats[4]);
  }

  gamesPlayed++;

  if(gameWon){
    gamesWon++;
    currentStreak++;
  }else{
    currentStreak = 0;
  }

  if(currentStreak > maxStreak){
    maxStreak = currentStreak;
  }

  winPercetage = ((gamesWon / gamesPlayed) * 100).toInt();

  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList('stats', [
    gamesPlayed.toString(),
    gamesWon.toString(),
    winPercetage.toString(),
    currentStreak.toString(),
    maxStreak.toString()
  ]);
}

Future<List<String>?> getStats() async{
  final prefs = await SharedPreferences.getInstance();
  final stats =  prefs.getStringList('stats');
  if(stats != null){
    return stats;
  }else{
    return null;
  }
}