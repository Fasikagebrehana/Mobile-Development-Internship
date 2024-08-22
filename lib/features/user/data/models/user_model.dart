import '../../domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required String name,
    required String username,
    required String password,
  }) : super(username: '', password: '');



factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  name: json['name'], 
  username: json['email'], 
  password: json['password'],
);

factory UserModel.fromUser(User user) {
  return UserModel(
    name: user.name ?? '', 
    username: user.username, 
    password: user.password
    );
}

Map<String, dynamic> toJson() => {
  "name" : name,
  "email" : username,
  "password" : password,
};

}