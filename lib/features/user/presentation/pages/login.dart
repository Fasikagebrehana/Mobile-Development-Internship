import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../../domain/entities/user.dart';
import '../bloc/bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, '/home');
        }else{
          print(state);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 160),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(7),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.blue.withOpacity(0.3),
                      //     spreadRadius: 0,
                      //     offset: Offset(0, 5),
                      //     blurRadius: 10,
                      //   )
                      // ]
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Center(
                      child: Text("ECOM",
                          style: GoogleFonts.caveatBrush(
                            textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: Text(
                    'Sign into your account',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w500))),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        maxLines: 1,
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'ex: jon.smith@email.com',
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.5)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: '*********',
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                      onPressed: () {
                        final String username = _usernameController.text;
                        final String password = _passwordController.text;

                        if (username.isNotEmpty && password.isNotEmpty) {
                          context.read<LoginBloc>().add(LoginLoadedEvent(
                              username: username, password: password));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please fill in all the fields')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(color: Colors.white)),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: GoogleFonts.poppins(),
                      ),
                      GestureDetector(
                          onTap: () =>
                              {
                                Navigator.pushNamed(context, '/signup')},
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.blue,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
