//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'Page2.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import 'camera.dart';

//import 'package:flutter_svg/flutter_svg.dart';

List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

MaterialColor MyGreen = const MaterialColor(0xFF00BFA5,
    {
      50:  Color(0xFF00E676),
      100: Color(0xFF69F0AE),
      200: Color(0xFF00C853),//메인으로 했던 컬러
      300: Color(0xFF00695C),//
      400: Color(0xFFB1DEB6),//
      500: Color(0xFF00796B),//
      600: Color(0xFF1DE9B6),
      700: Color(0xFF00BFA5), //메인컬러
      800: Color(0xFF1B5E20),
      900: Color(0xFFB9F6CA),
    });


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice App',
      theme: ThemeData(
        primarySwatch: MyGreen,
      ),
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('Tre:)sh',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                      color: Color(0xFF00BFA5),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('환경을 지키는 우리들의 분리수거 실천',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 15
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/tresh6.png')

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 1),
                child: Container(
                  height: 70,
                  child: MaterialButton(
                    //minWidth: double.infinity,
                    //height: 60,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(
                      //   color: Color(0xFF00BFA5)
                      // ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xFF00BFA5),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Page2()));
                    },//navigator 로 2페이지 이동
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          '분리수거 정보',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 1),
                child: Container(
                  height: 70,
                  child: MaterialButton(
                    //minWidth: double.infinity,
                    //height: 60,
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(
                      //     color: Color(0xFF00BFA5)
                      // ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xFF00BFA5),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          fullscreenDialog: true,
                          builder: (BuildContext){
                            return CameraScreen(
                            );
                          }
                      ));
                    },//navigator 로 3페이지 이동
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          '카메라',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
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
