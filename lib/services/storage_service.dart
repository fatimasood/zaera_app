import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/services/supabase_client.dart';

class StorageService {
  Future<String> uploadProfilePic(File file) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) throw Exception("Not logged in");

    final path = 'profile_pics/$userId.jpg';

    final response = await supabase.storage
        .from('avatars') // your bucket name
        .upload(path, file, fileOptions: FileOptions(upsert: true));

    if (response.isEmpty) throw Exception("Upload failed");

    return supabase.storage.from('avatars').getPublicUrl(path);
  }
}
