import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:myanmartypingtutor/screen/LoginScreen.dart';

void main() {
  runApp(const  MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(1200, 550);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Myanmar Typing Master";
    win.show();
  });
}

const borderColor = Color(0xFF805306);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: borderColor,
          width: 1,
          child: const Row(
            children: [LeftSide(), RightSide()],
          ),
        ),
      ),
    );
  }
}

const sidebarColor = Color(0xFFF6A00C);

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width/2,
        child: Container(
            color:const Color.fromARGB(230,255,224,167,), //rgba(255,224,167,255)
            child: Column(
              children: [
                WindowTitleBarBox(child: MoveWindow()),
                Expanded(child: Image.asset('assets/images/intro.png' , fit: BoxFit.fill,))
              ],
            )));
  }
}

const backgroundStartColor = Color(0xFFFFD500);
const backgroundEndColor = Color(0xFFF6A00C);

class RightSide extends StatefulWidget {
  const RightSide({super.key});

  @override
  State<RightSide> createState() => _RightSideState();
}

class _RightSideState extends State<RightSide> {
  // ignore: non_constant_identifier_names
  final BoxDecoration Bcolr = const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [backgroundStartColor, backgroundEndColor],
                    stops: [0.0, 1.0]),
              );

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Container(
            // decoration: Bcolr,
            color: backgroundStartColor,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              WindowTitleBarBox(
                child: Row(
                  children: [Expanded(child: MoveWindow()), const WindowButtons()],
                ),
              ),
          

            
            
            ],
            ),
          ),
          // Container(child: Center(child: const Text('Myanmar Typing Tutor' , style: TextStyle(color: Color.fromARGB(255, 84, 51, 10) , fontSize: 28 , fontWeight: FontWeight.bold ))), color: backgroundStartColor, width: screensize.width,),
          Expanded(
            child: Container(
                 decoration: Bcolr,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/gif/flyingBird.gif' ,fit: BoxFit.contain, width: screensize.width / 6 ,height: screensize.height / 9,),
                    SizedBox(width: screensize.width,child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Myanmar Typing Tutor' , style: TextStyle(color: Color.fromARGB(255, 84, 51, 10) , fontSize: 28 , fontWeight: FontWeight.bold )),
                        Text(' (Blue Bird edtition.)' , style: TextStyle(color: Colors.blueAccent , fontSize: 13),)
                      ],
                    ),),
                    const SizedBox(height: 30,),
                    SizedBox(width: screensize.width / 4 ,child: ElevatedButton(onPressed: (){}, child: const Text('Start') ) , ) ,
                    const SizedBox(height: 40,), // start button
                    SizedBox(width: screensize.width / 4 ,child: ElevatedButton(onPressed: (){}, child: const Text('Chapter') ) ,) , 
                    const SizedBox(height: 40,),// Chapter
                    SizedBox(width: screensize.width / 4 ,child: ElevatedButton(onPressed: (){}, child: const Text('Settings') ) ,) ,
                    const SizedBox(height: 40,), // Settings
                    SizedBox(width: screensize.width / 4 ,child: ElevatedButton(onPressed: (){}, child: const Text('Exit') ) ,) , // Exit
                    const SizedBox(height: 40,), 
                    const Text('• By using this software, you acknowledge that you have read and agree to our Terms of Service and Privacy Policy of RangoonX.' , style: TextStyle(color: Colors.blueGrey , fontSize: 13 ) ),
                    

                  ],
                ),
              ),
              
          ),
                              Container(child: Center(child: const Text('© 2024 RangoonX. All rights reserved.' , style: TextStyle(color: Colors.white , fontSize: 14), )),color:backgroundEndColor,width: screensize.width,)


        ],
      ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}