import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/constants.dart';
import '../controller/home_page_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavigationProvider);

    return Scaffold(
      backgroundColor: bgColor,
      body: child,
      bottomNavigationBar: BottomNavigationWidget(selectedIndex: selectedIndex),
    );
  }
}

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('selectedIndex: $selectedIndex');
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) => _onTap(context, value, ref),
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.black,
      // fixedColor: Colors.amber,
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.star_rounded),
          label: 'featured',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_rounded),
          label: 'My learning',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Accounts',
        ),
      ],
    );
  }

  void _onTap(BuildContext context, int index, WidgetRef ref) {
    ref.read(bottomNavigationProvider.notifier).setIndex(index);
    switch (index) {
      case 0:
        context.goNamed('featured');
        break;
      case 1:
        context.goNamed('search');
        break;
      case 2:
        context.goNamed('mylearning');
        break;
      case 3:
        context.goNamed('wishlist');
        break;
      case 4:
        context.goNamed('profile');
        break;

      default:
    }
  }
}
