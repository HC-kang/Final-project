import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraImage cameraImage;
  CameraController cameraController;
  String output = '';
  bool isWorking =false;

  loadmodel() async
  {
    await Tflite.loadModel(
        model: "assets/converted_model.tflite",
        labels: "assets/converted_model.txt",
        // model: "assets/mobilenet_v1_1.0_224.tflite",
        // labels: "assets/mobilenet_v1_1.0_224.txt"
    );
  }

  loadCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value)
    {
      if (!mounted)
      {
        return;
      }

      setState(() {
        cameraController.startImageStream((imageStream) =>
        {
          if(!isWorking)
            {
              cameraImage = imageStream,
              runModel(),
            }
        });
      });
    });
  }

  runModel() async
  {
    if (cameraImage != null)
    {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage.planes.map((plane)
          {
            return plane.bytes;
          }).toList(),

          imageHeight: cameraImage.height,
          imageWidth: cameraImage.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          threshold: 0.1,
          asynch: true
      );

      output = "";

      predictions.forEach((element)
      {
        output = element["label"];
            // + "  " + (element["confidence"] as double).toStringAsFixed(2);
      });

      setState(() {
        output;
      });

      isWorking = false;
    }
  }

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadmodel();
  }


  @override
  void dispose() async
  {
    super.dispose();

    await Tflite.close();
    cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('카메라',
          style: TextStyle(fontSize: 20, color: Color(0xFF00BFA5),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: height * 0.7,
              width: width * 1.8,
              child: !cameraController.value.isInitialized
                  ? Container()
                  : AspectRatio(
                aspectRatio: cameraController.value.aspectRatio,
                child: CameraPreview(cameraController),
              ),
            ),
          ),

          //기존 코드 -> 쓰레기를 보여주세요
          Column(
            //alignment: Alignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Color(0xFF00BFA5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                onPressed: () {  },
                child: Text(
                  output,
                  style: TextStyle(
                    // backgroundColor: Colors.black87,
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
