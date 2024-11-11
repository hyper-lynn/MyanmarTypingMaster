
//Intro screen of the main app , it always pop up frist 



import 'package:flutter/material.dart';




class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    //get width and heigh of Screen
    Size screensize = MediaQuery.of(context).size;

    return SafeArea(
      child: Column(
        children: [
          
          Expanded(child: Container(color: Colors.black, )),
    
    
          Expanded(child: Container(color: Colors.red,)),
        ],
      ));
  }
}