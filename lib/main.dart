import 'package:flutter/material.dart';
import 'package:lt_online/screens/app/profile.dart';
import 'package:lt_online/screens/loginProcess/login.dart';
import 'package:lt_online/screens/loginProcess/signup.dart';
import 'package:lt_online/screens/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: dotenv.get('SUPA_URL'),
    anonKey: dotenv.get('SUPA_ANON_KEY'),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 103, 9, 226),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: const Color.fromARGB(255, 103, 9, 226),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
        '/main': (_) => const ProfilePage(),
      },
    );
  }
}
