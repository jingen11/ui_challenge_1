import 'package:flutter/material.dart';

class Currency {
  final String name;
  final String price;
  final Icon icon;
  final String earning;
  final String percent;
  final List<Color> bgColor;
  final String tag;
  final String position;

  const Currency({
    this.name,
    this.price,
    this.icon,
    this.earning,
    this.percent,
    this.bgColor,
    this.tag,
    this.position,
  });
}
