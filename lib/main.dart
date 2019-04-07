import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(MaterialApp(
  home: MusicPlayer(),
  theme: ThemeData.dark(),
  ));

  class MusicPlayer extends StatefulWidget{
    @override
    _MusicPlayerState createState() => _MusicPlayerState();
  }

  class _MusicPlayerState extends State <MusicPlayer>{
    final audioName = "audio1.mp3";
    final musicName = "Octavia - Te Quiero mucho";
    final imageURL = "https://los40es00.epimg.net/los40/imagenes/2017/11/28/album/1511885438_220718_1512040981_album_normal.jpg";
    
    Duration duration = Duration();
    Duration position = Duration();

    AudioPlayer audioPlayer;
    AudioCache audioCache;

    double volumen = 1;
    double currentVolume = 0;

    @override
      void initState(){
        
        super.initState();

        audioPlayer = AudioPlayer();
        audioCache = AudioCache(fixedPlayer: audioPlayer);

        audioPlayer.positionHandler = (p) => setState((){
          position = p;
        });
        audioPlayer.durationHandler = (p) => setState((){
          duration = p;
        });
      }

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Music Player", style: TextStyle(
          fontSize: 20,
          color: Colors.yellow,
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(musicName, style: TextStyle(fontSize: 20)),
            ),
            Image.network(imageURL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: audioControls(),
            ),
            Slider(
            activeColor: Colors.green,
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              onChanged: (double seconds){
              setState(() {
                              audioPlayer.seek(Duration(seconds: seconds.toInt()));
                            });
              },
            )
          ],
        ))),
      );
    }
    Widget CreateIconButton(IconData icon,Color color, VoidCallback onPressed){
      return IconButton(
         icon: Icon(icon),
         iconSize: 30,
         color: color,
         onPressed: onPressed,
        );
    }

    List<Widget> audioControls(){
      return <Widget>[
          CreateIconButton(Icons.play_arrow,Colors.grey,()
        {
            audioCache.play(audioName);   
        }),
        CreateIconButton(Icons.pause,Colors.green,()
        {
          audioPlayer.pause();
        }),
        CreateIconButton(Icons.stop,Colors.purple,()
        {
          audioPlayer.stop();
        }),
        CreateIconButton(Icons.volume_up,Colors.orange,()
        {
          if(volumen < 1)
          {
            volumen += 0.1;
          audioPlayer.setVolume(volumen);
          }
          
        }),
        CreateIconButton(Icons.volume_down,Colors.orange,()
        {
          if(volumen != 0)
          {
            volumen -= 0.1;
          audioPlayer.setVolume(volumen);
          }
        }),
        CreateIconButton(Icons.volume_off,Colors.red,()
        {
          if(volumen != 0){
            currentVolume = volumen;
            volumen = 0;
          }else{
            volumen = currentVolume;
          }
          audioPlayer.setVolume(volumen);
        }),
        CreateIconButton(Icons.skip_next,Colors.black, ()
        {
          for (var i = 0; i < 3; i++) {
            audioPlayer.play(audioName);
          }
        })
      ];
    }
  }



  


  
