import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart' as custom_model;

class AuthService {
  final _supabase = Supabase.instance.client;
  Future<custom_model.User> signUp({
  required String name,
  required String email,
  required String password,
}) async {
  try {
    // Register the user with Supabase Auth
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'name': name}, // Pass name in metadata for trigger to use
    );
    
    if (response.user == null) {
      throw Exception('Failed to create user account');
    }
    
    // No manual profile insert needed - trigger will handle it
    
    return custom_model.User(
      id: response.user!.id,
      name: name,
      email: email,
      createdAt: DateTime.now(),
    );
  } catch (e) {
    throw Exception('Error during signup: ${e.toString()}');
  }
}
}