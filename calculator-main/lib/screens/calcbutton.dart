import 'package:calculatorapp/constants/colors.dart';
import 'package:calculatorapp/provider/calcprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Provider.of<Calcprovider>(context, listen: false).setValue("="),
      child: Container(
        width: 70,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Center(
          child: Text(
            "=",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
