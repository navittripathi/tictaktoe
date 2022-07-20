import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  bool isXorZero;
  int position;
  Function updatePosForParent;
  bool isPrint;
  String oldValue = "";

  Box(
      {required this.isXorZero,
      required this.position,
      required this.updatePosForParent,
      this.isPrint = false});

  printXorZero() {
    updatePosForParent(
        position); // Call parent function and passing the current position
  }

  printXorZeroValue() {
    print("XorZero Value Prnt Call $isPrint $isXorZero Position $position");

    if (isPrint) {
      return isXorZero ? "X" : "0";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        printXorZero();
      },
      child: Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.all(10),
          width: 100,
          height: 100,
          child: Center(child: Text(oldValue, style: TextStyle(fontSize: 30))),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 20)],
              color: Colors.grey),
        ),
      ),
    );
  }
}
