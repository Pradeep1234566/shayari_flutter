import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shayari/pages/shayari_page.dart';
// import 'shayari_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pages = shayariList
        .map((shayari) => Container(
              color: Color(int.parse("0xFF${shayari['color']!.substring(1)}")),
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
                          fontFamily: 'GoogleFonts.lobster().fontFamily',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();

    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        waveType: WaveType.liquidReveal,
        slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }
}
