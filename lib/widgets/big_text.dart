import 'package:flutter/material.dart';
import 'package:calendarific/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight fontWeight;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      this.size = 0,
      required this.text,
      required this.fontWeight,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: fontWeight),
    );
  }
}
