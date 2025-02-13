import 'package:elimika/state/auth/auth_notifier.dart';
import 'package:elimika/state/auth/authstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
