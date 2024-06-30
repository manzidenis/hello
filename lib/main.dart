import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_header_drawer.dart';
import 'login.dart';
import 'Calculator.dart';
import 'signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.login;

  @override
  Widget build(BuildContext context) {
    var container;
    var appBar;

    if (currentPage == DrawerSections.login) {
      container = Login();
      appBar = AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        backgroundColor: Colors.white,
      );
    } else if (currentPage == DrawerSections.signup) {
      container = SignUp();
      appBar = AppBar(
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        backgroundColor: Colors.white,
      );
    } else if (currentPage == DrawerSections.calculator) {
      container = CalculatorScreen();
      appBar = AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        backgroundColor: Colors.black,
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyDrawerHeader(),
                  MyDrawerList(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: getCurrentIndex(),
          onTap: (index) {
            setState(() {
              if (index == 0) {
                currentPage = DrawerSections.login;
              } else if (index == 1) {
                currentPage = DrawerSections.signup;
              } else if (index == 2) {
                currentPage = DrawerSections.calculator;
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_open),
              label: 'Sign In',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_rounded),
              label: 'Sign Up',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: 'Calculator',
            ),
          ],
        ),
      ),
    );
  }

  int getCurrentIndex() {
    if (currentPage == DrawerSections.login) {
      return 0;
    } else if (currentPage == DrawerSections.signup) {
      return 1;
    } else if (currentPage == DrawerSections.calculator) {
      return 2;
    } else {
      return 0;  // Default to 0 if not found
    }
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          menuItem(1, "SignIn", Icons.lock_open,
              currentPage == DrawerSections.login ? true : false),
          menuItem(2, "SignUp", Icons.person_add_alt_1_rounded,
              currentPage == DrawerSections.signup ? true : false),
          menuItem(3, "Calculator", Icons.calculate_rounded,
              currentPage == DrawerSections.calculator ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[400] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.login;
            } else if (id == 2) {
              currentPage = DrawerSections.signup;
            } else if (id == 3) {
              currentPage = DrawerSections.calculator;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.blue[800],
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  login,
  signup,
  calculator,
}
