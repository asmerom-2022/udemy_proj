import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authenticate/controller/login_controller.dart';
import '../../authenticate/widgets/textfield.dart';
import '../../common/error_widget.dart';
import '../../common/constants/constants.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final users = FirebaseAuth.instance.currentUser!;

  String photoUrl = 'https://pbs.twimg.com/media/Enh165pXIAAgtE1.jpg';

  @override
  Widget build(BuildContext context) {
    final String email = users.email.toString();
    final userData =
        FirebaseFirestore.instance.collection('users').doc(email).snapshots();
    return StreamBuilder<DocumentSnapshot>(
      stream: userData,
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const LoadingWidget()
            : ListView.builder(
                itemCount: 0,
                itemBuilder: ((context, index) {
                  DocumentSnapshot data = snapshot.data!;
                  print('current user is ${users.email}');
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: defaultPadding * 5),
                        const Text('account page'),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(users.photoURL != null
                              ? users.photoURL!
                              : photoUrl),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          email,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        KpTextField(readonly: true, maxlines: 1, hint: email
                            // hint: data['email'] ?? 'the competition description ',
                            ),
                        const SizedBox(height: defaultPadding),
                        KpTextField(
                          readonly: true,
                          maxlines: 1,
                          hint: users.displayName?.split(' ')[0] ??
                              data['firstName'],
                        ),
                        const SizedBox(height: defaultPadding),
                        KpTextField(
                          readonly: true,
                          maxlines: 1,
                          hint: users.displayName?.split(' ')[1] ??
                              data['lastName'],
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(loginControllerProvider.notifier)
                                    .signOut();
                              },
                              child: const Text('Sign out')),
                        ),
                      ],
                    ),
                  );
                }));
      },
    );
  }
}
