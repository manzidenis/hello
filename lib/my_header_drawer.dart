import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({super.key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.only(top:30.0, left: 10.0),
      child: Text("MENU", style: GoogleFonts.bahianita(color: Colors.white,fontSize: 55, fontWeight: FontWeight.bold,),),
    );
  }
}


