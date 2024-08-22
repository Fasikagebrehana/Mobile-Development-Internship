import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
    void initState(){
      super.initState();
        Future.delayed(Duration(seconds: 3), () async{
          final cache = await SharedPreferences.getInstance();
          final isLoggedIn = cache.getBool('isLoggedIn') ?? false;

          if (isLoggedIn) {
            Navigator.pushNamed(context, '/home');
          }else {
            Navigator.pushNamed(context, '/login');
          }
          });
        
        }

  @override
  Widget build(BuildContext context) {
   

    
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
        
            image: DecorationImage(image: AssetImage('assets/images/splash.png')
            ,
          fit: BoxFit.cover,
          ),
          ),
            ),
          Container(
        
            color: Colors.blueAccent.withOpacity(0.7),
          ),
        
          Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text('ECOM', 
                  style: GoogleFonts.caveatBrush(
                  textStyle: TextStyle(color: Colors.blue,
                  fontWeight: FontWeight.bold, fontSize: 40, 
                  // GoogleFonts.Caveat Brush
                  ),),
                  ),
                )
              ),
              Text('ECOMMERCE APP', 
              style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40, 
                fontWeight: FontWeight.bold
              ))),
            ],)
          )
          ],
          
          ),
      ),
        
      );
  }
}
  

