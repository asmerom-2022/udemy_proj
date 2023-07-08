import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/constants/constants.dart';
import '../../common/vplayer/new player/vidplyer_page.dart';

class Recomended_widget extends StatelessWidget {
  const Recomended_widget({
    super.key,
    required this.title,
    this.instructor,
    this.imageURL,
  });
  final String title;
  final String? instructor;
  final String? imageURL;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  VideoPlayer()),
  );
                    },
      child: SizedBox(
        width: 200,
        height: 250,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Image.network(
                  imageURL!,
                  fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                  Text(
                    instructor! ?? 'testing',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class categories extends StatelessWidget {
  const categories({
    super.key,
    required this.label,
  });

  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(4),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
          child: Text(
        label,
        style: const TextStyle(color: Colors.white54),
      )),
    );
  }
}