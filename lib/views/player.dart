import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_application/consts/colors.dart';
import 'package:music_player_application/consts/text_style.dart';
import 'package:music_player_application/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller  = Get.find<PlayerController>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: 250,
                height: 250,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                alignment: Alignment.center,
                child: QueryArtworkWidget(id:  data[controller.playIndex.value].id, type: ArtworkType.AUDIO,
                artworkWidth: double.infinity,
                artworkHeight: double.infinity,
                nullArtworkWidget: const Icon(Icons.music_note, size: 48, color: whiteColor,),)
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(
                () => Expanded(
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            data[controller.playIndex.value].displayNameWOExt,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:
                            ourStyle(color: bgDarkColor, family: bold, size: 20),
                          ),
                          Text(
                            data[controller.playIndex.value].artist.toString(),
                            style: ourStyle(
                                color: bgDarkColor, family: regular, size: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(
                            () => Row(
                              children: [
                                Text(
                                  controller.position.value,
                                  style: ourStyle(color: bgDarkColor),
                                ),
                                Expanded(
                                  child: Slider(
                                    thumbColor: sliderColor,
                                      inactiveColor: bgColor,
                                      activeColor: sliderColor,
                                      min: const Duration(seconds: 0).inSeconds.toDouble(),
                                      max: controller.max.value,
                                      value: controller.value.value, onChanged: (newvalue) {
                                        controller.changeDurationToSeconds(newvalue.toInt());
                                        newvalue = newvalue;
                                  }),
                                ),
                                Text(
                                  controller.duration.value,
                                  style: ourStyle(color: bgDarkColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.playSong(data[controller.playIndex.value].uri, controller.playIndex.value - 1);
                                  },
                                  icon: Icon(
                                    Icons.skip_previous_rounded,
                                    size: 40,
                                  )),
                              Obx(
                                () => CircleAvatar(
                                  radius: 35,
                                  backgroundColor: bgDarkColor,
                                  child: Center(
                                    child: Transform.scale(
                                      scale: 2.5,
                                      child: IconButton(
                                        onPressed: (() {
                                          if(controller.isPlaying.value){
                                            controller.audioPlayer.pause();
                                            controller.isPlaying(false);
                                          } else {
                                            controller.audioPlayer.play();
                                            controller.isPlaying(true);
                                          }
                                        }),
                                        icon: controller.isPlaying.value ? const Icon(Icons.pause) : const Icon(Icons.play_arrow_rounded),
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                              IconButton(
                                  onPressed: () {
                                      controller.playSong(data[controller.playIndex.value].uri, controller.playIndex.value + 1);
                                  },
                                  icon: Icon(Icons.skip_next_rounded, size: 40)),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
