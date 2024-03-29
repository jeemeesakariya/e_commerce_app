import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {

   BigText({
    super.key, 
    this.color= const Color(0xFF332d2d), 
    required this.text,
    this.overFlow=TextOverflow.ellipsis,
    this.size=20,
    });

  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font20:size,

      ),

    );
  }
}