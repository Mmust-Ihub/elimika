import 'dart:convert';

import 'package:elimika/state/auth/authstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await http.post(
        Uri.parse('https://elimika-chi.vercel.app/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': email,
          'password': password,
        }),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final token = responseData['key'];
        print(token);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        state = state.copyWith(
          isLoading: false,
          token: token,
          errorMessage: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: responseData['message'] ?? 'Authentication failed',
        );
      }
    } catch (e) {
      print(e);
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Network error. Please try again.',
      );
    }
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      state = state.copyWith(token: token);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    state = const AuthState();
  }
}
