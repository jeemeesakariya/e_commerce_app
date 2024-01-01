import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {

  Color? color;
  final String text;
  double size;
  double height;


   SmallText({
    super.key, 
    this.color= const Color(0xFFccc7c5), 
    required this.text,
    this.size=12,
    this.height=1.2
    });

  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      

      
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size,
        height: height,

      ),

    );
  }
}