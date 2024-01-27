import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_application/consts/colors.dart';
import 'package:music_player_application/consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search, color: whiteColor,))
        ],
        leading: Icon(Icons.sort_rounded, color: whiteColor,),
        title: Text(
          "Beats",
          style: ourStyle(family: 'bold'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 4),

              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                tileColor: bgColor,
                title: Text("Music name", style: ourStyle(
                    family: bold, size: 15),),
                subtitle:Text("Artist name", style: ourStyle(
                    family: regular, size: 12),),
                leading: Icon(Icons.music_note, color: whiteColor, size: 32),
                trailing: const Icon(Icons.play_arrow, color: whiteColor, size: 26,),

              ),
            );
          },),
      ),
    );
  }
}
