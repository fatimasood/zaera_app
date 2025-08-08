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

  //for profile

  Future<void> createProfile({
    required String userId,
    required String name,
    required String email,
    String? imageUrl,
    String? reminderMessage,
  }) async {
    await supabase.from('profiles').upsert({
      'id': userId,
      'name': name,
      'email': email,
      'profile_pic': imageUrl,
      'reminder_message': reminderMessage,
    });
  }

  //fetch profile
  Future<Map<String, dynamic>?> fetchProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return null;

    final response =
        await supabase.from('userprofile').select().eq('id', userId).single();

    return response;
  }

  //sessions
  Session? getSession() => supabase.auth.currentSession;
  User? getUser() => supabase.auth.currentUser;
}
