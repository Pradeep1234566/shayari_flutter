import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shayari/pages/shayari_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int currentPage = 0;

  void playAudio(String audioPath) async {
    await _audioPlayer.stop(); // Stop previous
    await _audioPlayer.play(AssetSource(audioPath)); // Play new
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: shayariList.map((shayari) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(shayari['background']!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      shayari['text']!,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(2, 2))
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(Icons.play_circle_fill,
                          color: Colors.white, size: 40),
                      onPressed: () => playAudio(shayari['audio']!),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        onPageChangeCallback: (index) {
          playAudio(shayariList[index]['audio']!); // Auto play
        },
      ),
    );
  }
}
