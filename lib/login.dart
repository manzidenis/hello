import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign In',
                style: GoogleFonts.bahianita(
                  color: Colors.blue[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0),
              Text(
                'Login to your account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),  // Increased height for more space
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Forgotten your password?',
                style: GoogleFonts.lato(
                  color: Colors.blue[900],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 28.0),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 28.0),
              RichText(
                textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Sign Up',
                    style: GoogleFonts.lato(
                      color: Colors.blue[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]

              )
                ),

            ],
          ),
        ),
      ),
    );
  }
}


