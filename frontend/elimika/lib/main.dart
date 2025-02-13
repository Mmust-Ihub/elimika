import 'package:elimika/pages/auth/login_page.dart';
import 'package:elimika/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await getToken();

  runApp(
    ProviderScope(
      child: MyApp(isLoggedIn: token != null),
    ),
  );
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

class MyApp extends ConsumerWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(object)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elimisha App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomePage() : const LoginScreen(),
      // Add your routes here
    );
  }
}
