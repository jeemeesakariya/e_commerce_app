import 'package:e_commerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidgets extends StatelessWidget {

  final IconData icon;
  final String text;
  
  final Color iconColor;

   IconAndTextWidgets({

    super.key,
  
    required this.icon,
    required this.iconColor,
    required this.text,

    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text:text,),
      ],
    );
  }
}