
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/firebase_services.dart';

final authProvider = Provider<FirebaseServices>(
  (ref) {
    return FirebaseServices(FirebaseAuth.instance);
  },
);

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authStateChange;
});

final loggedIn =
    StateNotifierProvider<LoginNotifier, bool>((ref) => LoginNotifier(false));

class LoginNotifier extends StateNotifier<bool> {
  LoginNotifier(state) : super(state);
}

class LoadingNotifier extends StateNotifier<bool> {
  LoadingNotifier(state) : super(state);

  void setLoading(bool isLoading) {
    state = isLoading;
  }
}
