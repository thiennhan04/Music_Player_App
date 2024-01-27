import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player_application/consts/colors.dart';

const bold = "bold";
const regular = "regular";
TextStyle ourStyle({String family = "regular", double size = 14, Color color = whiteColor}){
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: family == bold ? FontWeight.bold : FontWeight.normal,
  );
}