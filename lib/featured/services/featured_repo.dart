import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/models/course.dart';

class featuredrepo {
  Stream<List<course>> productslist() {
    try {
      final data =
          FirebaseFirestore.instance.collection('course').snapshots().map(
                (snapshot) => snapshot.docs
                    .map((doc) => course.fromMap(doc.data()))
                    .toList(),
              );
      return data;
    } catch (e) {
      throw ('Something went wrong here on featured repo.... $e');
    }
  }
}

final featuredrepoprovider = Provider<featuredrepo>((ref) {
  return featuredrepo();
});
