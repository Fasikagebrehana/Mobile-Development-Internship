import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String username;
  final String password;
  final String? name;


  User({
    required this.username,
    required this.password,
    this.name,
  });

  User.Login({
    required this.username,
    required this.password,
  }): name = null;

  User.Register({
    required this.username,
    required this.password,
    required this.name,
  });
  


  @override
  // TODO: implement props
  List<Object?> get props => [username, password];}