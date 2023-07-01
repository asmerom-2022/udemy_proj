import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 64, right: 16, left: 16),
      child: Column(
        children: [
          Text(
            'this is wishlist page',
            style: TextStyle(fontSize: 16, color: Colors.white),
          )
        ],
      ),
    );
  }
}
