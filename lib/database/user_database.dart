// user database

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaera_app/models/user/user_model.dart';

class UserDatabase {
  final database = Supabase.instance.client.from('zaera_users');

  //Create

  Future createUser(UserModel newUser) async {
    await database.insert(newUser.toMap());
  }

  //Read

  final stream = Supabase.instance.client
      .from('zaera_users')
      .stream(primaryKey: ['id'])
      .map(
        (data) => data.map((userMap) => UserModel.fromMap(userMap)).toList(),
      );

  //Update

  Future<void> updateUser(
    UserModel oldUser, {
    String? name,
    String? email,
  }) async {
    final updates = <String, dynamic>{};
    if (name != null) updates['name'] = name;
    if (email != null) updates['email'] = email;
    if (updates.isEmpty) return;
    await database.update(updates).eq('id', oldUser.id!);
  }

  //Delete

  Future deleteUser(UserModel user) async {
    await database.delete().eq('id', user.id!);
  }
}
