import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Sign In button action
              },
              icon: Icon(Icons.lock_open, color: Colors.white),
              label: Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 28)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Sign Out button action
              },
              icon: Icon(Icons.person_add_alt_1_rounded, color: Colors.white),
              label: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 28)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Calculator button action
              },
              icon: Icon(Icons.calculate, color: Colors.white),
              label: Text('Calculator', style: TextStyle(color: Colors.white, fontSize: 28)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
