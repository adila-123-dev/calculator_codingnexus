import 'package:calculatorapp/provider/calcprovider.dart';
import 'package:calculatorapp/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Calculatorapp());
}

class Calculatorapp extends StatelessWidget {
  const Calculatorapp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Calcprovider(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
