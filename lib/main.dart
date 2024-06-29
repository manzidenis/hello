import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_header_drawer.dart';
import 'login.dart';
import 'Calculator.dart';
import 'signup.dart';
import 'home.dart';

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
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    var appBar;

    if (currentPage == DrawerSections.home) {
      container = HomeScreen();
      appBar = AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 34),
        title: Text('Flutter Demo App', style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
      );
    } else if (currentPage == DrawerSections.login) {
      container = Login();
      appBar = AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 35),
          onPressed: () {
            setState(() {
              currentPage = DrawerSections.home;
            });
          },
        ),
      );
    } else if (currentPage == DrawerSections.signup) {
      container = SignUp();
      appBar = AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 35),
          onPressed: () {
            setState(() {
              currentPage = DrawerSections.home;
            });
          },
        ),
      );
    } else if (currentPage == DrawerSections.calculator) {
      container = CalculatorScreen();
      appBar = AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 35),
          onPressed: () {
            setState(() {
              currentPage = DrawerSections.home;
            });
          },
        ),
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
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          menuItem(1, "Home", Icons.home,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "SignIn", Icons.lock_open,
              currentPage == DrawerSections.login ? true : false),
          menuItem(3, "SignUp", Icons.person_add_alt_1_rounded,
              currentPage == DrawerSections.signup ? true : false),
          menuItem(4, "Calculator", Icons.calculate_rounded,
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
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.login;
            } else if (id == 3) {
              currentPage = DrawerSections.signup;
            } else if (id == 4) {
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
  home,
  login,
  signup,
  calculator,
}
