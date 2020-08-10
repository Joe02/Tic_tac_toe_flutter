import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tic_tac_toe/utils/matrix_checker.dart';
import 'package:tic_tac_toe/widgets/tic_tac_toe.dart';

void main() {
  runApp(Phoenix(child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: MyTicTacToe(),
      ),
    );
  }
}

class MyTicTacToe extends StatefulWidget {
  @override
  MyTicTacToeState createState() => MyTicTacToeState();
}

class MyTicTacToeState extends State<MyTicTacToe> {
  String winner = "";
  int _moveCounter = 0;
  List<bool> isSuccessful = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<int> matrixValues = [2, 2, 2, 2, 2, 2, 2, 2, 2];
  String crossOrCircle = "Cross";
  String lastAction = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTicTacToe(),
        buildDynamicButton(),
      ],
    );
  }

  buildTicTacToe() {
    return TicTacToe(matrixValues, isSuccessful, updateGameValues);
  }

  buildDynamicButton() {

    ///Draggable for populating the matrix either with X's or O's
    if (_moveCounter < 9 && winner == "")
      return Draggable(
        data: 'Cross or Circle',
        feedback: decideWhichIcon(),
        child: decideWhichIcon(),
      );
    else

      ///Refresh game button
      return InkWell(
        onTap: () {
          Phoenix.rebirth(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Icon(
              Icons.autorenew,
              size: 100,
            ),
          ),
        ),
      );
  }

  updateGameValues(int index) {
    _moveCounter++;
    isSuccessful[index] = true;
    lastAction = crossOrCircle;
    matrixValues[index] = lastAction == "Cross" ? 1 : 0;
    crossOrCircle = crossOrCircle == "Cross" ? "Circle" : "Cross";
    setState(() {
      winner = checkMatrix(index, matrixValues, lastAction);
      winner != "" ? Scaffold.of(context).showSnackBar(
        // ignore: unnecessary_statements
        SnackBar(content: Text("Vitória dos $winner's"),),) : null;
    });
  }

  decideWhichIcon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Icon(
            lastAction == "Cross" ? Icons.album : Icons.clear,
            size: 100,
          )),
    );
  }
}
