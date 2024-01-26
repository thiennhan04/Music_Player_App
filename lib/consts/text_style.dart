import 'dart:ui';

import 'package:music_player_application/consts/colors.dart';

const bold = "bold";
const regular = "regular";
ourStyle({family = "regular", double? size = 14, color = whiteColor}){
  return TextStyle(
    fontSize: size,
    color: whiteColor,
    fontWeight: FontWeight.bold,
  );
}