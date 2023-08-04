import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  String? txt;
  double? size;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;


  CustomText(this.txt, this.size, this.color, this.fontWeight, this.fontStyle);

  @override
  Widget build(BuildContext context) {
    return Text(txt ?? "Your text",style: TextStyle(
      color: color,fontWeight: fontWeight,fontSize:size,fontStyle: fontStyle
    ),);
  }
}
