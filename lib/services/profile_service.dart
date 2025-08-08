import 'package:zaera_app/services/supabase_client.dart';

class ProfileService {
  Future<void> updateProfile({
    required String name,
    required String email,
    String? imageUrl,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) throw Exception('User not signed in');

    await supabase.from('profiles').upsert({
      'id': userId,
      'name': name,
      'email': email,
      'profile_picture': imageUrl,
    });
  }

  Future<Map<String, dynamic>?> fetchProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) throw Exception("User not logged in");

    final response =
        await supabase.from('profiles').select().eq('id', userId).single();

    print("Current user ID: ${supabase.auth.currentUser?.id}");

    return response;
  }

  //get user name
  Future<String> getUserName() async {
    final userId = supabase.auth.currentUser?.id;

    if (userId == null) return 'Guest';

    final response =
        await supabase
            .from('profiles')
            .select('name')
            .eq('id', userId)
            .single();

    return response['name'] ?? 'User';
  }
}
