import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/profile.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<void> logIn(String username, String password);
  Future<User> Register(String name, String username, String password);
  Future<User> Profile();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {

  SharedPreferences sharedPreferences;

  
  late final http.Client client;
  UserRemoteDataSourceImpl({required this.client, required this.sharedPreferences});

  @override
  Future<void> logIn(String username, String password) async {
    const url = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';

    final response = await client.post(Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email' : username,
        'password' : password,
      }
      )
    );


    print(response.statusCode);

    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      final accesstoken = jsonResponse['data']['access_token'];
      var local = sharedPreferences.setString('token',accesstoken);
      
      print(response.body);

      // final userRequest = await client.get(Uri.parse(url));
      // final user = json.decode(userRequest.body);
      // print('object');
      // print(user);
      // // print(user);
      // return user;
      // return UserModel.fromJson(jsonResponse['data']);
    }else {
      throw('Failed to login');
    }
  }


  
  @override
  Future<User> Register(String name, String username, String password) async{
    // TODO: implement Register
    final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
  print(name);
      print(username);
      print(password);
    final response = await client.post(Uri.parse(url),
    
    headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': name,
        'email': username,
        'password': password,
      }),
    );
    // print(response.body);
    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      jsonResponse['data']['password'] = password;
      return UserModel.fromJson(jsonResponse['data']);
      
    }else{
      throw('failed to register');
    }
  }
  
  @override
  Future<User> Profile() async{
    // TODO: implement Profile

    final url = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me';
    var token = sharedPreferences.getString('token');

    var h = {
      'Authorization' : 'Bearer $token'
    };

    final request = await client.get(Uri.parse(url), headers: h,);
  
    if (request.statusCode == 200) {
      print(request.body);
      final response = json.decode(request.body);
      
      // response['data']['password'] = 'yffygh';
      var vt = UserModel.fromJson(response['data']);
      print(vt);
      return vt;
    }else {
      throw('error');
    }


  }


}