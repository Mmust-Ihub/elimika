import 'dart:convert';

import 'package:elimika/state/chat/chatState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState());

  Future<void> chat(String message, List history) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final response = await http.post(
        Uri.parse('https://elimika-chi.vercel.app/api/v1/recommendations/student-chat/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {
            "text": "hello",
            "history": history,
          },
        ),
      );

      print(response.statusCode);
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final response = responseData['response'];
        print(response);
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);
        state = state.copyWith(
          isLoading: false,
          response: response,
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
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier() : super(ReportState());

  Future<void> report() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final token = await getToken();
    print(token);

    try {
      final response = await http.post(
        Uri.parse(
            'https://csc2g744-8000.uks1.devtunnels.ms/api/v1/career-chat/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Token $token"
        },
      );

      print(response.body);
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final response = responseData['response'];
        print(response);
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);
        state = state.copyWith(
          isLoading: false,
          response: response,
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
        errorMessage: e.toString(),
      );
    }
  }
}
