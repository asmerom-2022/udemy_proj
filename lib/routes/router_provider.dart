import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_prac/featured/screen/featured_page.dart';
import 'package:udemy_prac/my_learning/screen/my_learning.dart';
import 'package:udemy_prac/profile/screen/account.dart';
import 'package:udemy_prac/search/screen/search_page.dart';
import 'package:udemy_prac/wishlist/screen/wishlist_page.dart';

import '../authenticate/providers/auth_state_change_provider.dart';
import '../authenticate/screens/login_page.dart';
import '../authenticate/screens/registration.dart';
import '../home/screen/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  final isAuthed = ref.watch(authStateProvider);

  isAuthed.hasValue;

  return GoRouter(
      navigatorKey: _rootNavigator,
      initialLocation: '/',
      redirect: (context, state) {
        final isRegistering = state.matchedLocation == '/register';
        final isLoggingIn = state.matchedLocation == '/login';
        final status = isAuthed.value != null;

        log('isAuthed: $status');

        if (isAuthed.value == null && !isLoggingIn && !isRegistering) {
          return '/login';
        }
        if (isAuthed.value == null && !isLoggingIn && isRegistering) {
          return '/register';
        }
        if (isAuthed.value != null && isLoggingIn && !isRegistering) {
          return '/';
        }

        return null;
      },
      routes: [
        GoRoute(
            path: '/login',
            name: 'login',
            builder: (context, state) {
              return LoginPage(
                key: state.pageKey,
              );
            }),
        GoRoute(
            path: '/register',
            name: 'register',
            builder: (context, state) {
              return RegistrationPage(
                key: state.pageKey,
              );
            }),
        ShellRoute(
            navigatorKey: _shellNavigator,
            builder: (context, state, child) {
              return HomePage(
                key: state.pageKey,
                child: child,
              );
            },
            routes: [
              GoRoute(
                  // parentNavigatorKey: _shellNavigator,
                  path: '/',
                  name: 'featured',
                  builder: (context, state) {
                    return FeaturedPage();
                  }),
              GoRoute(
                  // parentNavigatorKey: _shellNavigator,
                  path: '/search',
                  name: 'search',
                  builder: (context, state) {
                    return const SearchPage();
                  }),

              GoRoute(
                path: '/mylearning',
                name: 'mylearning',
                builder: (context, state) {
                  return const MylearningPage();
                },
              ),
              GoRoute(
                path: '/wishlist',
                name: 'wishlist',
                builder: (context, state) {
                  return const WishlistPage();
                },
              ),
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) {
                  return const ProfilePage();
                },
              ),
              //       GoRoute(
              //         path: 'product-details',
              //         name: 'product-details',
              //         builder: (context, state) {
              //           Product prods = state.extra! as Product;
              //           return ProductDetailsPage(
              //             key: state.pageKey,
              //             product: prods,
              //           );
              //         },
              //       ),
              //       // GoRoute(
              //       //   path: 'trailer-products',
              //       //   name: 'trailer-products',
              //       //   builder: (context, state) {
              //       //     return VideoPlayer();
              //       //   },
              //       // )
            ]),
      ]);
});

/// context.go  context.push