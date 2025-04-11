import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/services/navigation_service.dart';
import '../locator.dart';

final NavigationService navigationService = getIt<NavigationService>();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class AppText extends StatelessWidget {
  final String? text;

  final bool isBold;
  final double size;
  final String fontFamily;
  final Color? color;
  final FontWeight weight;
  final TextAlign align;
  final TextStyle? style;

  const AppText(
    this.text, {
    Key? key,
    this.isBold = false,
    this.size = 14,
    this.fontFamily = 'Montserrat',
    this.color,
    this.weight = FontWeight.normal,
    this.align = TextAlign.start,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: align,
      style:
          style ??
          TextStyle(
            fontFamily: 'ProximaNova',
            fontSize: size,
            fontWeight: isBold ? FontWeight.w700 : weight,
            color: color,
          ),
    );
  }
}
