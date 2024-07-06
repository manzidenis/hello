import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'internet_connectivity_service.dart';
import 'battery_service.dart';
import 'theme_service.dart';
import 'my_header_drawer.dart';
import 'login.dart';
import 'Calculator.dart';
import 'signup.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBe7K04bfqCD21Yyy0Eoq_gxPqNQiIE9Ic",
        appId: "1:674674388532:android:70007bfd2aa22b6f9a2461",
        messagingSenderId: "674674388532",
        projectId: "authproject-590af"
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeService.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: const HomePage(),
          );
        },
      ),
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
  late InternetConnectivityService _internetConnectivityService;
  final BatteryService _batteryService = BatteryService();

  @override
  void initState() {
    super.initState();
    _internetConnectivityService = InternetConnectivityService(context);
    _batteryService.initialize();  // Pass context here
  }

  @override
  void dispose() {
    _internetConnectivityService.dispose();
    _batteryService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var container;
    var appBar;

    if (currentPage == DrawerSections.home) {
      container =  Home();
      appBar = AppBar(
        iconTheme: IconThemeData(
          color: Provider.of<ThemeService>(context).isDarkMode ? Colors.white : Colors.black,
          size: 35,
        ),
        title: Text(
          "Flutter App",
          style: TextStyle(
            color: Provider.of<ThemeService>(context).isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Provider.of<ThemeService>(context).isDarkMode ? Colors.black : Colors.white,
      );
    } else if (currentPage == DrawerSections.login) {
      container = Login();
    } else if (currentPage == DrawerSections.signup) {
      container = const SignUp();
    } else if (currentPage == DrawerSections.calculator) {
      container = const CalculatorScreen();
    }

    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: container,
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyDrawerHeader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Consumer<ThemeService>(
          builder: (context, themeService, child) {
            Color selectedItemColor = themeService.isDarkMode ? Colors.blue.shade800 : Colors.blue.shade800;
            Color unselectedItemColor = themeService.isDarkMode ? Colors.white : Colors.black;

            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: getCurrentIndex(),
              onTap: (index) {
                setState(() {
                  if (index == 0) {
                    currentPage = DrawerSections.home;
                  } else if (index == 1) {
                    currentPage = DrawerSections.login;
                  } else if (index == 2) {
                    currentPage = DrawerSections.signup;
                  } else if (index == 3) {
                    currentPage = DrawerSections.calculator;
                  }
                });
              },
              selectedItemColor: selectedItemColor,
              unselectedItemColor: unselectedItemColor,
              selectedLabelStyle: TextStyle(color: selectedItemColor),
              unselectedLabelStyle: TextStyle(color: unselectedItemColor),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
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
            );
          },
        ),
      ),
    );
  }

  int getCurrentIndex() {
    if (currentPage == DrawerSections.login) {
      return 1;
    } else if (currentPage == DrawerSections.signup) {
      return 2;
    } else if (currentPage == DrawerSections.calculator) {
      return 3;
    } else {
      return 0; // Default to 0 for home
    }
  }

  Widget MyDrawerList() {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return Container(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              menuItem(1, "Home", Icons.home, currentPage == DrawerSections.home),
              menuItem(2, "Sign In", Icons.lock_open, currentPage == DrawerSections.login),
              menuItem(3, "Sign Up", Icons.person_add_alt_1_rounded, currentPage == DrawerSections.signup),
              menuItem(4, "Calculator", Icons.calculate_rounded, currentPage == DrawerSections.calculator),
              ListTile(
                leading: Icon(Icons.brightness_6, color: themeService.isDarkMode ? Colors.white : Colors.black),
                title: Text('Toggle Theme', style: GoogleFonts.lato(fontSize: 20, color: themeService.isDarkMode ? Colors.white : Colors.black)),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<ThemeService>(context, listen: false).toggleTheme();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    bool isDarkMode = Provider.of<ThemeService>(context).isDarkMode;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color iconColor = isDarkMode ? Colors.white : Colors.black;

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
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: iconColor,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                    color: textColor,
                    fontSize: 20,
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
