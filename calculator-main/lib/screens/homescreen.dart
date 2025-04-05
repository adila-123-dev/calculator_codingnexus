import 'package:calculatorapp/constants/colors.dart';
import 'package:calculatorapp/provider/calcprovider.dart';
import 'package:calculatorapp/screens/calcbutton.dart';
import 'package:calculatorapp/screens/widgetdata.dart';
import 'package:calculatorapp/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Calcprovider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset:
              true, // Ensures UI adjusts when keyboard appears
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: const Text(
              'CALCULATOR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              double screenHeight = constraints.maxHeight;
              double screenWidth = constraints.maxWidth;

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    child:
                        CustomTextWidget(controller: provider.compController),
                  ),
                  const Spacer(),
                  Container(
                    height: screenHeight * 0.6,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // First three rows of buttons
                        for (int i = 0; i < 3; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                                4, (index) => buttonList[i * 4 + index]),
                          ),
                        SizedBox(height: screenHeight * 0.02),
                        // Last row with zero and CalculateButton
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        3, (index) => buttonList[12 + index]),
                                  ),
                                  SizedBox(height: screenHeight * 0.03),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        3, (index) => buttonList[15 + index]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            const CalculateButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
