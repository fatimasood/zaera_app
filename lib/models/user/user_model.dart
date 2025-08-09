// for name and username

class UserModel {
  int? id;
  late String name;
  late String email;

  UserModel({this.id, required this.name, required this.email});

  //map to user

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  //user to map

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email};
  }
}
