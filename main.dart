import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'screens/auth/signup_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/supabase_config.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load();
  
  // Initialize Supabase
  await Supabase.initialize(
    url: SupabaseConfig.url ,
    anonKey: SupabaseConfig.anonKey
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Signup with Supabase',
      theme: AppTheme.lightTheme,
      home: const SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}