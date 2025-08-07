import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController {
  final supabase = Supabase.instance.client;

  //sign up

  Future<AuthResponse> signUp(String email, String password) async {
    return await supabase.auth.signUp(password: password, email: email);
  }

  //sign in

  Future<AuthResponse> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    return await supabase.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  //sign out
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  //get user mail

  String? getCurrentUserEmail() {
    final session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

  Session? getSession() => supabase.auth.currentSession;
  User? getUser() => supabase.auth.currentUser;
}
