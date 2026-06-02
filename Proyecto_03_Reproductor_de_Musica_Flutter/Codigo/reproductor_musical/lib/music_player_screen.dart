import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart'; // Importante para usar Rx
import 'package:reproductor_musical/position_data.dart';
import 'package:reproductor_musical/seek_bar.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  String currentTrack = '21 Questions';
  String artist = '50 cent';

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAudio();
  }

  
  Future<void> _loadAudio() async {
    try {
      await _audioPlayer.setAsset(
          'assets/50 Cent - 21 Questions (Official Music Video) ft. Nate Dogg.mp3');
    } catch (e) {
      debugPrint("Error loading audio:  $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream, // Faltaba coma
        _audioPlayer.bufferedPositionStream, // Faltaba coma
        _audioPlayer.durationStream.map((duration) => duration ?? Duration.zero),
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration!),
      );

  // Corregido: 'void' va con minúscula inicial
  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 8, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 147, 8, 8),
        elevation: 0,
        // Corregido: 'Text' con mayúscula y comas dentro
        title: const Text(
          'Spotify',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      // Corregido: El child (Column) debe ir DENTRO del Padding
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/50_cent.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ), // Faltaba coma
            const SizedBox(height: 30), // Faltaba coma
            Text(
              currentTrack,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Faltaba coma
                color: Colors.white,
              ),
            ), // Faltaba coma
            const SizedBox(height: 10), // Faltaba coma
            Text(
              artist,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ), // Faltaba coma
            const SizedBox(height: 30), // Faltaba coma
            StreamBuilder<PositionData>(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                
                final positionData = snapshot.data; 
                return SeekBar(
                  duration: positionData?.duration ?? Duration.zero,
                  position: positionData?.position ?? Duration.zero,
                  bufferedPosition: positionData?.bufferedPosition ?? Duration.zero, 
                  onChangeEnd: (newPosition) {
                    _audioPlayer.seek(newPosition);
                  },
                ); 
              },
            ), // Faltaba coma
            const SizedBox(height: 30), // Faltaba coma
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
       
                IconButton(
                  iconSize: 40,
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 64,
                  icon: Icon(
                    isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                    color: Colors.white,
                  ),
                  onPressed: _playPause,
                ),
                
                IconButton(
                  iconSize: 40,
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}