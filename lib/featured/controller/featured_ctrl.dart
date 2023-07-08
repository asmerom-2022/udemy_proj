import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/models/course.dart';

import '../services/featured_repo.dart';


class featuredCtrl {
  featuredCtrl({required this.ref});
  final Ref ref;

  Stream<List<course>> watchProductList() {
    try {
      return ref.read(featuredrepoprovider).productslist();
    } catch (e) {
      throw ('Something went wrong here on featured control.... $e');
    }
  }
}

final featuredctrlprovider = Provider<featuredCtrl>((ref) {
  return featuredCtrl(ref: ref);
});
final featuredprovider = StreamProvider<List<course>>((ref) {
  return ref.read(featuredctrlprovider).watchProductList();
});
