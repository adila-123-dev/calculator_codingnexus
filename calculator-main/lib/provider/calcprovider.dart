import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Calcprovider extends ChangeNotifier {
  final compController = TextEditingController();

  setValue(String value) {
    String str = compController.text;
    switch (value) {
      case 'C':
        compController.clear();
        break;
      case 'AC':
        compController.text = str.substring(0, str.length - 1);
        break;
      case 'X':
        compController.text += '*';
        break;
      case '=':
        compute();
        break;
      default:
        compController.text += value;
    }
    compController.selection = TextSelection.fromPosition(
        TextPosition(offset: compController.text.length));
  }

  compute() {
    String text = compController.text;
    compController.text = text.interpret().toString();
  }

  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
