import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/bloc/signup_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
                        listener: (context, state) {
                          // TODO: implement listener
                          if (state is SignupSuccessState) {
                            Navigator.pushNamed(context, '/login');
                          }
                          else if (state is SignupFailedState) {
                            // print('bla');
                          }else {
                            // print('qwerty');
                          }
                        },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.6),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(7),
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.04,
                child: Center(
                  child: Text(
                    "ECOM",
                    style: GoogleFonts.caveatBrush(
                      textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Create your account',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            maxLines: 1,
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'ex: jon smith',
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
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
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Password',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '*********',
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Confirm Password',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '*********',
                              hintStyle: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: _agreeToTerms,
                              onChanged: (bool? value) {
                                setState(() {
                                  _agreeToTerms = value ?? false;
                                });
                              },
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'I understood the ',
                                    style: GoogleFonts.poppins(),
                                  ),
                                  GestureDetector(
                                      onTap: () => {},
                                      child: Text(
                                        'terms & policy. ',
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
                        SizedBox(height: 50),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {
                              final String name = _nameController.text;
                              final String username = _usernameController.text;
                              final String password = _passwordController.text;

                              if (username.isNotEmpty && password.isNotEmpty) {
                                context.read<SignupBloc>().add(
                                    SignupLoadedEvent(
                                        name: name,
                                        username: username,
                                        password: password));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please fill in all the fields')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an account? ',
                                style: GoogleFonts.poppins(),
                              ),
                              GestureDetector(
                                  onTap: () =>
                                      {Navigator.pushNamed(context, '/login')},
                                  child: Text(
                                    'SIGN IN',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
