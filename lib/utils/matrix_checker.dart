checkMatrix(int index, matrixValues, lastIcon) {
  bool gameEnded = false;
  matrixValues[index] = lastIcon == "Cross" ? 1 : 0;

  if (matrixValues[0] == 1 && matrixValues[1] == 1 && matrixValues[2] == 1) {
    print("Vitória dos X's");
    gameEnded = true;
  } else if (matrixValues[3] == 1 && matrixValues[4] == 1 && matrixValues[5] == 1) {
    print("Vitória dos X's");
    gameEnded = true;
  } else if (matrixValues[6] == 1 && matrixValues[7] == 1 && matrixValues[8] == 1) {
    print("Vitória dos X's");
    gameEnded = true;
  } else if (matrixValues[0] == 1 && matrixValues[3] == 1 && matrixValues[6] == 1) {
    print("Vítoria dos X's");
    gameEnded = true;
  } else if (matrixValues[1] == 1 && matrixValues[4] == 1 && matrixValues[7] == 1) {
    print("Vítoria dos X's");
    gameEnded = true;
  } else if (matrixValues[2] == 1 && matrixValues[5] == 1 && matrixValues[8] == 1) {
    print("Vítoria dos X's");
    gameEnded = true;
  } else if (matrixValues[0] == 1 && matrixValues[4] == 1 && matrixValues[8] == 1) {
    print("Vítoria dos X's");
    gameEnded = true;
  } else if (matrixValues[2] == 1 && matrixValues[4] == 1 && matrixValues[6] == 1) {
    print("Vítoria dos X's");
    gameEnded = true;
  }

  if (gameEnded == true) {
    return "X";
  }


  if (matrixValues[0] == 0 && matrixValues[1] == 0 && matrixValues[2] == 0) {
    print("Vitória dos O's");
    gameEnded = true;
  } else if (matrixValues[3] == 0 && matrixValues[4] == 0 && matrixValues[5] == 0) {
    print("Vitória dos O's");
    gameEnded = true;
  } else if (matrixValues[6] == 0 && matrixValues[7] == 0 && matrixValues[8] == 0) {
    print("Vitória dos O's");
    gameEnded = true;
  } else if (matrixValues[0] == 0 && matrixValues[3] == 0 && matrixValues[6] == 0) {
    print("Vítoria dos O's");
    gameEnded = true;
  } else if (matrixValues[1] == 0 && matrixValues[4] == 0 && matrixValues[7] == 0) {
    print("Vítoria dos O's");
    gameEnded = true;
  } else if (matrixValues[2] == 0 && matrixValues[5] == 0 && matrixValues[8] == 0) {
    print("Vítoria dos O's");
    gameEnded = true;
  } else if (matrixValues[0] == 0 && matrixValues[4] == 0 && matrixValues[8] == 0) {
    print("Vítoria dos O's");
    gameEnded = true;
  } else if (matrixValues[2] == 0 && matrixValues[4] == 0 && matrixValues[6] == 0) {
    print("Vítoria dos O's");
    gameEnded = true;
  }

  if (gameEnded == true) {
    return "Y";
  }

  return "";
}