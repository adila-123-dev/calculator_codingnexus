import 'package:calculatorapp/constants/colors.dart';
import 'package:calculatorapp/provider/calcprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button1 extends StatelessWidget {
  const Button1({
    super.key,
    required this.label,
    this.textcolor = Colors.white,
    this.onTap,
  });

  final String label;
  final Color textcolor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Provider.of<Calcprovider>(context, listen: false).setValue(label),
      borderRadius: BorderRadius.circular(50),
      child: Material(
        elevation: 3,
        color: AppColors.secondary2Color,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          radius: 36,
          backgroundColor: AppColors.secondary2Color,
          child: Text(
            label,
            style: TextStyle(
              color: textcolor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
