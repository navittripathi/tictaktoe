import 'package:flutter/material.dart';
//import 'package:layout_demo/widgets/box.dart';
import 'package:tictactoe/box.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  late bool flag;
  late int currentPosition;
  late List<String> allBoxValues = ["", "", "", "", "", "", "", "", ""];
  int buttonClickCount = 0;
  String message = "";
  bool isGameFinish = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flag = true;
    currentPosition = 0;
  }

  isNotEmpty(String value) {
    return value.trim().length > 0;
  }

  isRowValueSame(String first, String second, String third) {
    return first.compareTo(second) == 0 && first.compareTo(third) == 0;
  }

  isSame(String first, String second, String third) {
    if (isNotEmpty(first) && isNotEmpty(second) && isNotEmpty(third)) {
      if (isRowValueSame(first, second, third)) {
        return true;
      }
    }
    return false;
  }

  isGameOver() {
    return isSame(allBoxValues[0], allBoxValues[1], allBoxValues[2]) ||
        isSame(allBoxValues[3], allBoxValues[4], allBoxValues[5]) ||
        isSame(allBoxValues[6], allBoxValues[7], allBoxValues[8]) ||
        isSame(allBoxValues[0], allBoxValues[3], allBoxValues[6]) ||
        isSame(allBoxValues[1], allBoxValues[4], allBoxValues[7]) ||
        isSame(allBoxValues[2], allBoxValues[5], allBoxValues[8]) ||
        isSame(allBoxValues[0], allBoxValues[4], allBoxValues[8]) ||
        isSame(allBoxValues[2], allBoxValues[4], allBoxValues[6]);
    // if (isSame(allBoxValues[0], allBoxValues[1], allBoxValues[2])) {
    //   return true;
    // }
  }

  updatePosition(int pos) {
    if (!isGameFinish) {
      currentPosition = pos;
      buttonClickCount++;
      print("Update Pos call $pos");
      flag = !flag;
      if (allBoxValues[currentPosition - 1].length <= 0) {
        allBoxValues[currentPosition - 1] = flag ? "X" : "0";
      }
      if (buttonClickCount >= 5) {
        if (isGameOver()) {
          message = "winner is $flag ";
          isGameFinish = true;
        }
        //message = isGameOver() ? "Game Over" : "";
      }

      setState(() {}); // to call build
    }
  }

  @override
  Widget build(BuildContext context) {
    posCount = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            Text(
              'Tic Tac Toe Game ',
              style: TextStyle(fontSize: 40),
            ),
            ..._createRow()
          ],
        )),
      )),
    );
  }

  List<Widget> _createRow() {
    int noOfRows = 3;
    List<Widget> list = [];
    for (int i = 1; i <= noOfRows; i++) {
      list.add(Row(
        children: _createBox(),
      ));
    }
    return list;
  }

  int posCount = 1;
  List<Widget> _createBox() {
    int noOfBox = 3;
    List<Widget> boxes = [];
    for (int i = 1; i <= noOfBox; i++) {
      // if (currentPosition > 0 &&
      //     allBoxValues[currentPosition - 1].length <= 0) {
      //   if (currentPosition == posCount) {
      //     boxes.add(Box(
      //       isXorZero: flag,
      //       position: posCount,
      //       updatePosForParent: updatePosition,
      //       isPrint: true,
      //     ));
      //   } else {
      //     boxes.add(Box(
      //       isXorZero: flag,
      //       position: posCount,
      //       updatePosForParent: updatePosition,
      //     ));
      //   }
      // } else {
      Box box = Box(
        isXorZero: flag,
        position: posCount,
        updatePosForParent: updatePosition,
      );
      box.oldValue = currentPosition == 0 ? "" : allBoxValues[posCount - 1];
      boxes.add(box);
      //}
      posCount++;
    }
    return boxes;
  }
}
