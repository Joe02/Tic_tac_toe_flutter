import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicTacToe extends StatelessWidget {
  final matrixValues;
  final isSuccessful;
  final updateGameValues;

  TicTacToe(this.matrixValues, this.isSuccessful, this.updateGameValues);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                9,
                (index) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  elevation: 5,
                  child: isSuccessful[index] == false
                      ? DragTarget(
                          builder: (context, List<String> candidateData,
                              rejectedData) {
                            return Center(
                              child: Container(
                                height: 200.0,
                                width: 200.0,
                              ),
                            );
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                          onAccept: (data) {
                            updateGameValues(index);
                          },
                        )
                      : Column(
                          children: <Widget>[
                            Expanded(
                              child: FittedBox(
                                child: matrixValues[index] == 1
                                    ? Icon(Icons.clear)
                                    : matrixValues[index] == 0
                                        ? Icon(Icons.album)
                                        : Container(),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
