import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: MusicPlayer(),
    ));

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioName = ["audio1.mp3,audio2.mp3"];
  final musicName = "Music";
  final imageURL = "https://media1.tenor.com/images/b3e86955a0b0052baa344e21eaf2a3f6/tenor.gif?itemid=12190249";

  AudioPlayer audioPlayer;
  AudioCache audioCache;

  double volume = 1;
  double currentVolume;

  Duration duration = Duration();
  Duration position = Duration();

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });

    audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReproductorMusica",
            style: TextStyle(fontSize: 20, color: Colors.yellow)),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(musicName, style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageURL)),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: audioControls(),
                    ),
                  ),
                  Slider(
                    activeColor: Colors.purpleAccent,
                    value: position.inSeconds.toDouble(),
                    max: duration.inSeconds.toDouble(),
                    onChanged: (double seconds) {
                      setState(() {
                        audioPlayer.seek(Duration(seconds: seconds.toInt()));
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget CreateIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30,
      color: color,
      onPressed: onPressed,
    );
  }

  List<Widget> audioControls() {
    return <Widget>[
      CreateIconButton(Icons.skip_previous, Colors.black, (){

      }),
      CreateIconButton(Icons.play_arrow, Colors.green, () {
        audioCache.play(audioName[1]);
      }),
      CreateIconButton(Icons.pause, Colors.grey, () {
        audioPlayer.pause();
      }),
      CreateIconButton(Icons.volume_up, Colors.yellow, () {
        if (volume < 1) {
          volume += 0.1;
          audioPlayer.setVolume(volume);
        }
      }),
      CreateIconButton(Icons.volume_down, Colors.yellow, () {
        if (volume > 0) {
          volume -= 0.1;
          audioPlayer.setVolume(volume);
        }
      }),
      CreateIconButton(Icons.volume_off, Colors.red, () {
        if (volume != 0) {
          currentVolume = volume;
          volume = 0;
        } else {
          volume = currentVolume;
        }
        audioPlayer.setVolume(volume);
      }),
      CreateIconButton(Icons.skip_next, Colors.black, (){
      
      })
    ];
  }
}
