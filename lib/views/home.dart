import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_application/consts/colors.dart';
import 'package:music_player_application/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beats",
          style: ourStyle(family: 'bold'),
        ),
      ),
    );
  }
}
