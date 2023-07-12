import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/common/constants/constants.dart';

import '../../authenticate/controller/login_controller.dart';
import '../../common/error_widget.dart';
import '../components/widgets.dart';
import '../controller/featured_ctrl.dart';

class FeaturedPage extends ConsumerWidget {
  FeaturedPage({super.key});

  final User users = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(featuredprovider);
    final String email = users.email.toString();
    final userData =
        FirebaseFirestore.instance.collection('users').doc(email).snapshots();

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
              'the udemy practice is coming soon',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'we will release on the next few months and you can use as you want .....',
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
                    imageURL: 'https://firebasestorage.googleapis.com/v0/b/udemy-proj-2c8cc.appspot.com/o/images%2Fonline_course.png?alt=media&token=ca7a4b7f-d98d-4d49-b5cc-cf959f1cdf52',
                  ),
                  SizedBox(width: 8),
                  Recomended_widget(
                    title: 'AWS Certified cloud practitioner',
                    instructor: ' stephen mark',
                    imageURL: 'https://firebasestorage.googleapis.com/v0/b/udemy-proj-2c8cc.appspot.com/o/images%2Fonline_course.png?alt=media&token=ca7a4b7f-d98d-4d49-b5cc-cf959f1cdf52',
                  ),
                  SizedBox(width: 8),
                  Recomended_widget(
                    title: 'cloud competing Certified tutorial for beginner',
                    instructor: 'imam telia',
                    imageURL: 'https://firebasestorage.googleapis.com/v0/b/udemy-proj-2c8cc.appspot.com/o/images%2Fonline_course.png?alt=media&token=ca7a4b7f-d98d-4d49-b5cc-cf959f1cdf52',
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
          course.when(data: (data){
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
             children: [
                Container(
                 height: MediaQuery.of(context).size.height * 0.8,
                 child: GridView.builder(
                   itemCount: data.length,
                   gridDelegate:
                       const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 4,
                           mainAxisSpacing: 8),
                   itemBuilder: (context, index) {
                     return Recomended_widget(
                     title: data[index].title!,
                     instructor: data[index].instructor! ,
                     imageURL: data[index].imageURL! ,
                     );
                   },
                 ),
               )
             ],
            ),
          );
                 }, 
                 error: (Object error, StackTrace stackTrace) {
          return AdminErrorWidget(message: error.toString());
        },
        loading: () {
          return const LoadingWidget();
        },
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



