import 'dart:math';

class pokeBomb{
  static int row = 6;
  static int col = 6;
  static int cells = row * col;
  bool gameOver = false;
  List<Cell> gameMap = [];
  static List<List<dynamic>> map = List.generate(row, (x) => List.generate(col, (y) => Cell(x,y,'',false)));

  void generateMap(){
    placeBombs(5);
    for(int i = 0;i <row;i++){
      for(int j =0;j<col;j++){
        gameMap.add(map[i][j]);
      }
    }
  }

  void toggleFlaggedCell(Cell cell) {
    if (!cell.reveal) {
      cell.flagged = !cell.flagged;
    }
  }

  void resetGame(){
    map = List.generate(row, (x) => List.generate(col, (y) => Cell(x, y, "", false)));
    gameMap.clear();
    generateMap();
  }

  static void placeBombs(int bombsNumber){
    Random random = Random();
    for(int i =0; i<bombsNumber;i++){
      int bombRow = random.nextInt(row);
      int bombCol = random.nextInt(col);
      map[bombRow][bombCol] = Cell(bombRow, bombCol, "X", false);
    }
  }

  void showBombs(){
    for(int i = 0; i<row; i++){
      for(int j = 0; j<col; j++){
        if(map[i][j].content == "X"){
          map[i][j].reveal = true;
        }
      }
    }
  }

  bool isGameFinished() {
    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        if (!map[i][j].reveal && map[i][j].content != "X") {
          return false;
        }
      }
    }
    return true;
  }


  void getClickedCell(Cell cell){
    if(cell.content == "X"){
      showBombs();
      gameOver = true;
    }else{
      int bombCount = 0;
      int cellRow = cell.row;
      int cellCol = cell.col;

      for(int i = max(cellRow-1, 0);i<= min(cellRow+1, row-1); i++){
        for(int j = max(cellCol-1, 0);j<= min(cellCol+1, col-1); j++){
          if(map[i][j].content == "X"){
            bombCount++;
          }
        }
      }
      cell.content = bombCount;
      cell.reveal = true;
      if(bombCount == 0){
        for(int i = max(cellRow-1, 0); i<= min(cellRow+1, row-1);i++){
          for(int j = max(cellCol-1, 0);j<=min(cellCol+1, col-1);j++){
            if(map[i][j].content == ""){
              getClickedCell(map[i][j]);
            }
          }
        }
      }
      if (isGameFinished()) {
        print("You Win!");
      }
    }
  }
}

class Cell{
  int row;
  int col;
  bool flagged = false;
  dynamic content;
  bool reveal = false;
  Cell(this.row,this.col,this.content, this.reveal);
}