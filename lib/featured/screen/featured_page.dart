import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_prac/common/constants/constants.dart';

import '../../authenticate/controller/login_controller.dart';
import '../../common/vplayer/new player/player_page.dart';
import '../../common/vplayer/new player/vidplyer_page.dart';
import '../../common/vplayer/vplayer.dart';

class FeaturedPage extends ConsumerWidget {
  FeaturedPage({super.key});

  final User users = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String email = users.email.toString();
    final userData =
        FirebaseFirestore.instance.collection('users').doc(email).snapshots();
    print('user is $users');
    log('user is $users');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 64, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'welcome, ${users.displayName ?? 'user'} ',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )),
            const SizedBox(height: 16),
            const Text(
              'the udemy pracice is coming soon',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'we will realease on the next few months and you can use as you want .....',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recommended for you',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Recomended_widget(
                    title: 'HTML and CSS tutorial',
                    instructor: 'thomas fiber',
                  ),
                  SizedBox(width: 8),
                  Recomended_widget(
                    title: 'AWS Certified cloud practitioneer',
                    instructor: ' stephene mark',
                  ),
                  SizedBox(width: 8),
                  Recomended_widget(
                    title: 'cloud competing Certified tutorial for begginer',
                    instructor: 'imam teli',
                  ),
                ],
              ),
            ),
            TitleText('Categories'),
            const Row(
              children: [
                categories(label: 'python class'),
                categories(label: 'AWS course'),
              ],
            ),
            const SizedBox(height: 16),
            TitleText('popular for advancing devops Engineers'),
            const SingleChildScrollView(
              child: Row(
                children: [
                  Recomended_widget(
                    title:
                        'flutter full tutorial for beginner to connect with back end',
                    instructor: 'edison hammer',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    ref.read(loginControllerProvider.notifier).signOut();
                  },
                  child: const Text('Sign out')),
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

class Recomended_widget extends StatelessWidget {
  const Recomended_widget({
    super.key,
    required this.title,
    this.instructor,
  });
  final String title;
  final String? instructor;

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
                  'https://media.istockphoto.com/photos/excited-woman-wearing-rainbow-cardigan-picture-id1327495437',
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
                    instructor!,
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
